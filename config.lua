-- 脚本选项配置参数
-- pConfig.ip 当前脚本选择的ip  
-- pConfig.ipID 当前脚本选择的ip的UUID
-- pConfig.EmailRight 当前脚本邮箱的后缀
function pConfig:runPPconfig()
    w,h = getScreenSize()

    UINew(1,"PP注册","确定","取消","uiconfig.dat",0,3,w-10,h,"255,255,255","255,255,255","","dot",1,15,"left")
    
    UICombo(1,"PPtype","注册7.42.3,注册8.6.1,领取8.6","0",0);
    
    UICombo(1,"ip","proxy,rola,proxyP","0",0);
    UIEdit(1,"ipID","ip id","ip id",15,"center","38,38,38","default",0)
    UIEdit(1,"proPUsername","username","username",15,"center","38,38,38","default",0)
    UIEdit(1,"proPNikename","nikename","nikename",15,"center","38,38,38","default",0)

    UILine(num,align,width,height,color)
    
    UILabel(1,"邮箱后缀",15,"center");
    UIEdit(1,"EmailRight","",".com",15,"center","38,38,38","default",0)
    
    UILabel(1,"密码",15,"center");
    UIEdit(1,"PPPassword","","Zz112233@",15,"center","38,38,38","default",0)

    UILabel(1,"程序超时时间",15,"center");
    UIEdit(1,"timer","20","20",15,"center","38,38,38","default",0)
    
    UILabel(1,"来码超时时间",15,"center");
    UIEdit(1,"phoneTimer","1","1",15,"center","38,38,38","default",0)


    ret = UIShow(0);
    
    

    if ret == 1 then
        nLog("开始运行")
        
        pConfig.type = PPtype;
        pConfig.ip = ip;
        pConfig.ipID = ipID;
        pConfig.proPUsername = proPUsername;
        pConfig.proPNikename = proPNikename;
        pConfig.timer = timer;
        pConfig.phoneTimer = phoneTimer;
        pConfig.PPPassword = PPPassword;
        mSleep(10)
        if EmailRight == nil or EmailRight == ".com" then
            pConfig.EmailRight = "gmail.com";
        else
            pConfig.EmailRight = EmailRight;
        end
        
        mSleep(10)
    
    elseif  ret == 0 then
        -- 脚本退出函数
        lua_exit();
    end
    
end