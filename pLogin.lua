require "FactoryFunction";
require "pLoginFun";


function pConfig.runLogin()
   
    -- 8.5.0 登录
    loginData = pConfig.findFile("860.txt");
    -- 账号
    -- dialog(loginData[1])
    -- -- 用户名
    -- dialog(loginData[2])
    -- -- ssn
    -- dialog(loginData[3])
    -- dialog(loginData[4])
    runApp(bundleID[3]); 
    while (true) do
        -- 超时重启脚本函数
        pConfig.timeOut()
        local login86X,login86Y = findImage("img/login-8.6.png",24,1220,374,1324);
        mSleep(10)
        if (login86X ~= -1 and login86Y ~= -1 )  then 
           
            tap(login86X,login86Y)
            break;
        end
    end
    mSleep(1000);
    
    loginEmail86X,loginEmail86Y = "";
    loginWD86X,loginWD86Y = "";
    -- 写登录
    while (true) do
        -- 超时重启脚本函数
        pConfig.timeOut()
        local loginEmail86X1,loginEmail86Y1 = findImage("img/login-Eamil-8.6.png",10,175,737,461);
        local loginEmail86X2,loginEmail86Y2 = findImage("img/login-Eamil-8.6(2).png",25,455,660,524);
        
        if loginEmail86X1 ~= -1 and loginEmail86Y1 ~= -1 then
            loginEmail86X = loginEmail86X1;
            loginEmail86Y = loginEmail86Y1;
        elseif  loginEmail86X2 ~= -1 and loginEmail86Y2 ~= -1 then
            loginEmail86X = loginEmail86X2 + 3;
            loginEmail86Y = loginEmail86Y2 + 3;
        end
        
        local loginWD86X1,loginWD86Y1 = findImage("img/login-password-8.6.png",19,452,741,673);
        local loginWD86X2,loginWD86Y2 = findImage("img/login-password-8.6(2).png",32,542,559,631);

        if loginWD86X1 ~= -1 and loginWD86Y1 ~= -1 then
            loginWD86X = loginWD86X1;
            loginWD86Y = loginWD86Y1;
        elseif  loginWD86X2 ~= -1 and loginWD86Y2 ~= -1 then
            loginWD86X = loginEmail86X2 + 3;
            loginWD86Y = loginEmail86Y2 + 6;
        end
        
        mSleep(10)
        if (loginEmail86X ~= -1 and loginEmail86Y ~= -1 )  then 
            tap(loginEmail86X,loginEmail86Y)
            mSleep(2000)
            -- 输入账号
            inputKey( loginData[1] );
            
            
            mSleep(100)
            -- if (loginWD86X ~= -1 and loginWD86Y ~= -1 )  then 
                tap(659,1290);
                mSleep(2000);
                -- 输入密码
                inputKey( loginData[2] );
                
                mSleep(1000)
                
                tap(659,1290);
                break;
            -- end
        end
    end
    mSleep(2000);

    -- 验证框
    -- while (true) do
    --     -- 超时重启脚本函数
    --     pConfig.timeOut()
    --     local VerifyBox86X,VerifyBox86Y = findImage("img/VerifyBox-8.6.png",15,184,736,747);
    --     mSleep(10)
    --     if (VerifyBox86X ~= -1 and VerifyBox86Y ~= -1 )  then 

    --         tap( VerifyBox86X + 3,VerifyBox86Y + 3 );
    --         break;
    --     end
    -- end
    
    mSleep(5000);
    -- 验证框点击完毕 等待进入账号页面
    pConfig.pLoginGet5()
end