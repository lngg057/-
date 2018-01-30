package ph.goods.customim.core;

import android.content.Context;
import android.text.TextUtils;

import org.jivesoftware.smack.ChatManager;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.SASLAuthentication;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.SmackException;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Registration;
import org.jivesoftware.smack.tcp.XMPPTCPConnection;
import org.jivesoftware.smack.util.StringUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import de.greenrobot.event.EventBus;
import ph.goods.customim.bean.Msg;
import ph.goods.customim.bean.Seller;
import ph.goods.customim.tools.CommonUtil;
import ph.goods.customim.tools.DataBaseUtil;
import ph.goods.manager.PreferenceUtil;
import ph.goods.utils.App_Config;

/**
 * Created by wener.pc on 2017/4/2.
 * 负责和xmpp服务器连接，asmack使用
 * 连接、登录、联系人、发送接收
 */
public class ConnectionManager implements PacketFilter, PacketListener {
    //xmpp服务器地址
//    private static final String DEF_HOST = "47.90.77.140";
//    private static final String GOODS_HOST = "192.168.2.162";
    private static final String GOODS_HOST = "47.90.104.235";
    public static String HOST = GOODS_HOST;
    //xmpp默认端口
    private static final int PORT = 5222;
    //连接类
    private XMPPTCPConnection xmpptcpConnection;

    /*----*/
    private static ConnectionManager manager = new ConnectionManager();

    private ConnectionManager() {

    }

    public static ConnectionManager getInstance() {
        return manager;
    }

    //连接方法
    public void connect(String serviceIP,String username,String psw) throws IOException, XMPPException, SmackException {
        if (!TextUtils.isEmpty(serviceIP)) {
            HOST = serviceIP;
        }
        ConnectionConfiguration connectionConfiguration = new ConnectionConfiguration(HOST, PORT);
        //设置可以重新连接
        connectionConfiguration.setReconnectionAllowed(true);
        //设置安全模式
        connectionConfiguration.setSecurityMode(ConnectionConfiguration.SecurityMode.disabled);
        //连接标示
        connectionConfiguration.setSendPresence(true);
        //加密方式.
        SASLAuthentication.supportSASLMechanism("PLAIN", 0);
        xmpptcpConnection = new XMPPTCPConnection(connectionConfiguration);
        xmpptcpConnection.connect();

        regist(xmpptcpConnection, username,psw);
    }

    /**
     * 注册
     * @param name
     * @param pwd
     * @return 0 服务端无响应  1成功  2已存在 3 失败
     */
    public int regist(XMPPConnection con,String name , String psw){

        Registration reg = new Registration();
        reg.setType(IQ.Type.SET);
        reg.setTo(con.getServiceName());
        Map<String, String> attributes = new HashMap();
        attributes.put("username",name);
        attributes.put("password",psw);
        attributes.put("Android", "createUser");
        reg.setAttributes(attributes);
        PacketFilter filter = new AndFilter(new PacketIDFilter(reg.getPacketID()));
        PacketCollector col = con.createPacketCollector(filter);
        try {
            con.sendPacket(reg);
        } catch (SmackException.NotConnectedException e) {
            e.printStackTrace();
        }
        IQ result = (IQ) col.nextResult(5000);
        col.cancel();
        if(null==result){
            return 0;
        }else if(result.getType() == IQ.Type.RESULT){
            return 1;
        }else if(result.getType() == IQ.Type.ERROR){
            if(result.getError().toString().equalsIgnoreCase("conflict(409)")){
                return 2;
            }else{
                return 3;
            }
        }
        return 3;
        }

    //登录方法
    public void login(Context mContext,String account, String password) {
        try {
//            regist(xmpptcpConnection,account,password);

            xmpptcpConnection.login(account, password);
        } catch (XMPPException e) {
            e.printStackTrace();
        } catch (SmackException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (xmpptcpConnection.isAuthenticated()) {
//           丢到创建商户表的时候生成数据库
           /* String name = generaDbNameByUserJid();
            DataBaseUtil.init(mContext, generaDbNameByUserJid());*/
            xmpptcpConnection.addPacketListener(this, this);
        }
    }

    //获取用户名字，建议聊天账户使用app会员账户
    private String generaDbNameByUserJid() {
        return CommonUtil.hanziTextToPinyinFormat(xmpptcpConnection.getUser());
    }

    //判断是否登录
    public boolean isConnected() {
        return xmpptcpConnection != null && xmpptcpConnection.isConnected();
    }

    //获取自己的jid,xmpp的完整帐号
    public String getAccountJid() {
        return xmpptcpConnection.getUser();
    }

    //登出
    public void disconnect() throws SmackException.NotConnectedException {
        xmpptcpConnection.disconnect();
    }

    //获取Roster对象去：获取联系人列表数据
    public Roster getRoster() {
        return xmpptcpConnection.getRoster();
    }

    //获取ChatManager:通过ChatManager去创建聊天发送消息及接受消息
    public ChatManager getChatManager() {
        return ChatManager.getInstanceFor(xmpptcpConnection);
    }

    //消息观察者
    public interface MsgObserver {
        void notify(Msg msg);
    }

    private List<MsgObserver> mMsgObservers = new ArrayList<>();

    //添加观察者
    public void addMsgObserver(MsgObserver msgObserver) {
        this.mMsgObservers.add(msgObserver);
    }

    //移除观察者
    public void removeMsgObserver(MsgObserver msgObserver) {
        this.mMsgObservers.remove(msgObserver);
    }

    //JID转换MsgObserver
    private Map<String, MsgObserver> mChatByJidMsgObservers = new HashMap<>();

    public void addChatMsgObserver(String userJid, MsgObserver msgObserver) {
        mChatByJidMsgObservers.put(userJid, msgObserver);
    }

    public void removeChatMsgObserver(String userJid) {
        mChatByJidMsgObservers.remove(userJid);
    }

    /**
     * 过滤器过滤消息：好友出席的消息Presence, Message, .....
     * 这里只需要Message对象数据
     */
    @Override
    public boolean accept(Packet packet) {
        return packet instanceof Message;
    }

    /**
     * 接受消息：
     * 当接受到来自好友的消息的时候：1.通知界面 2.保存消息到数据库
     * 观察者模式， add, remove
     * 在子线程被调用
     */
    @Override
    public void processPacket(Packet packet) throws SmackException.NotConnectedException {
        Message message = (Message) packet;
        String messageFrom = message.getFrom();
        String comeMsgJid = getComeMsgJidByMessageFrom(messageFrom);
//        Log.i(TAG, message.toXML());

        String parentname = comeMsgJid.replace("+40","@");
        parentname = parentname.replace("-40"," ");
        parentname = parentname.replace("+27","'");
        int t = parentname.indexOf("@");
        parentname = parentname.substring(0,t);

        //保存新消息到商家数据库
        Seller seller = DataBaseUtil.getSeller(parentname);
        int n;
        if(seller == null){
            //删除了商家消息后，商家主动发消息，需要重新建立商家列表
            seller = Seller.createSeller(parentname,"","","","","","","");
            n = seller.getNew_msg_num()+1;
        }else{
            n = seller.getNew_msg_num()+1;
        }

        seller.setNew_msg_num(n);
        DataBaseUtil.saveSeller(seller);

        Msg msg = Msg.createMsg(Msg.MSG_TYPE_RECEIVE, parentname, message.getBody());
        msg.setPartnerLogo(seller.getPartnerLogo());
        //保存消息到数据库
        DataBaseUtil.saveMsg(msg);

        //更新home主页新消息数量
        EventBus.getDefault().post("refresh_msg_count");

        //通知所有的观察者
        for (MsgObserver msgObserver : mMsgObservers) {
            msgObserver.notify(msg);
        }

        //通知聊天界面:ChatActivity
        MsgObserver msgObserver = mChatByJidMsgObservers.get(parentname);
        if (msgObserver != null) {
            msgObserver.notify(msg);
        }


    }

    private String getComeMsgJidByMessageFrom(String messageFrom) {
        int end = messageFrom.lastIndexOf("/");
        // left<=  < end
        return messageFrom.substring(0, end);
    }

    /**
     * 注册
     *
     * @param account 注册帐号
     * @param password 注册密码
     * @return 1、注册成功 0、服务器没有返回结果2、这个账号已经存在3、注册失败
     */
   /* public String regist(XMPPConnection connection, String account, String password) {
        if (connection == null)
            return "0";
        Registration reg = new Registration();
        reg.setType(IQ.Type.SET);
        reg.setTo(ClientConServer.connection.getServiceName());
        reg.setUsername(account);// 注意这里createAccount注册时，参数是username，不是jid，是“@”前面的部分。
        reg.setPassword(password);
        reg.addAttribute("android", "geolo_createUser_android");// 这边addAttribute不能为空，否则出错。所以做个标志是android手机创建的吧！！！！！
        PacketFilter filter = new AndFilter(new PacketIDFilter(
                reg.getPacketID()), new PacketTypeFilter(IQ.class));
        PacketCollector collector = ClientConServer.connection
                .createPacketCollector(filter);
        ClientConServer.connection.sendPacket(reg);
        IQ result = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        // Stop queuing results
        collector.cancel();// 停止请求results（是否成功的结果）
        if (result == null) {
//            Log.e("RegistActivity", "No response from server.");
            return "0";
        } else if (result.getType() == IQ.Type.RESULT) {
            return "1";
        } else { // if (result.getType() == IQ.Type.ERROR)
            if (result.getError().toString().equalsIgnoreCase("conflict(409)")) {
//                Log.e("RegistActivity", "IQ.Type.ERROR: "  + result.getError().toString());
                return "2";
            } else {
//                Log.e("RegistActivity", "IQ.Type.ERROR: " + result.getError().toString());
                return "3";
            }
        }
    }*/

}
