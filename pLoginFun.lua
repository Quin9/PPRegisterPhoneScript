function pConfig.pLoginGet5ToTxt()
    playAudio("img/test.m4r");
    setVolumeLevel(0.8)
    mSleep(6000);
    playAudio("")
    mSleep(2000);
    toast("10天5刀")

    -- while (true) do
    --     -- 超时重启脚本函数
    --     pConfig.timeOut()
    --     toast("进入机器码")
    --     local VerifyBox86X,VerifyBox86Y = findImage("img/VerifyBox-8.6.png",38,212,715,783);
    --     mSleep(1000)
    --     if (VerifyBox86X ~= -1 and VerifyBox86Y ~= -1 )  then 
    --         toast("进入机器码++++++++")
    --         tap( VerifyBox86X + 3,VerifyBox86Y + 3 );
    --         break;
    --     end
    -- end
    
    while (true) do
        local get5OK86X,get5OK86Y = findImage("img/get5MOK-8.6.png",7,136,739,801);
        mSleep(1000)
        if (get5OK86X ~= -1 and get5OK86Y ~= -1 )  then 
    pConfig.createTxt("10天有5刀.txt");
    pConfig.removeFileList("860.txt");
                toast("领取成功|||||||||||")

            break;
        end
    end
end


-- 这个函数是查卷函数
function pConfig.pLoginGet5Action()
    -- 找 link bank or card 判断是不是卡片模式
    


    
    while (true) do
       
        local loginSYBank86X,loginSYBank86Y = findImage("img/login-linkBank-8.6.png",7,136,748,649);
        if loginSYBank86X ~= -1 and loginSYBank86Y ~= -1 then
            -- 找到银行按钮 这里就是卡片模式
            toast("卡片")
            mSleep(5000)
            -- local get5M86X,get5M86Y = findImage("img/get5M-8.6.png",6,40,734,1140);
            -- local get5M86X1,get5M86Y1 = findImage("img/get5M1-8.6.png",6,40,734,1140);
            -- if (get5M86X ~= -1 and get5M86Y ~= -1) or (get5M86X1 ~= -1 and get5M86Y1 ~= -1) then
            local loginSYWC86Color = getColor(331,676);
            -- toast( string.format("0x%X",loginSYWC86Color) )

            local get5MBTN86X,get5MBTN86Y = findImage("img/get5MBTN-8.6.png",6,40,734,1140);
            if get5MBTN86X ~= -1 and get5MBTN86Y ~= -1 then
                mSleep(3000);
                tap(get5MBTN86X,get5MBTN86Y)
                toast("卡片式 5$")
            
                pConfig.pLoginGet5ToTxt()
                break;
            elseif string.format("0x%X",loginSYWC86Color) == "0xF7F5F0" then
                mSleep(2000);
                -- toast("空白卡片")
                pConfig.createTxt("可能有再跑一次.txt");
                pConfig.removeFileList("860.txt");
                break;
                
            else 
                pConfig.createTxt("没刀.txt");
                pConfig.removeFileList("860.txt");
                break;
            end
        end
    
    
    
        local loginSYBC86X,loginSYBC86Y = findImage("img/login-bigCard-8.6.png",20,194,726,810);
        local loginSYBC86X1,loginSYBC86Y1 = findImage("img/login-bigCard1-8.6.png",20,194,726,810);
        if( loginSYBC86X ~= -1 and loginSYBC86Y ~= -1 ) or ( loginSYBC86X1 ~= -1 and loginSYBC86Y1 ~= -1 ) then
        
            -- toast("滑动" )
            mSleep(1000)
            touch():on(400,400):move(400,350):off()
            mSleep(3000);
            -- touch():on(400,400):move(400,350):off()
            mSleep(5000)
            
            -- 拖动完毕后找 缝隙大小
            local findHeight86X,findHeight86Y = findImage("img/findHeight-8.6.png",6,192,289,566);
            if findHeight86X ~= -1 and findHeight86Y ~= -1 then
                -- dialog( findHeight86X.."point" ..findHeight86Y )
                local whitePointX = findHeight86X + 50;
                local whitePointY = findHeight86Y - 61;
                
                local pointColor = getColor(whitePointX,whitePointY);
                if string.format("0x%X",pointColor) ~= "0x1040C1" then
                    -- dialog(string.format("0x%X",pointColor));
                    pConfig.createTxt("可能有再跑一次.txt");
                    pConfig.removeFileList("860.txt");
                end
            end
            
            mSleep(5000)
            -- local get5M86X,get5M86Y = findImage("img/get5M-8.6.png",6,40,734,1140);
            -- local get5M86X1,get5M86Y1 = findImage("img/get5M1-8.6.png",6,40,734,1140);
            -- if (get5M86X ~= -1 and get5M86Y ~= -1) or (get5M86X1 ~= -1 and get5M86Y1 ~= -1) then
            local get5MBTN86X,get5MBTN86Y = findImage("img/get5MBTN-8.6.png",6,40,734,1140);
            if get5MBTN86X ~= -1 and get5MBTN86Y ~= -1 then
                toast("大卡 5$")
                mSleep(5000);
                tap(get5MBTN86X + 20,get5MBTN86Y + 70)

                -- if get5M86X ~= -1 then
                --     tap(get5M86X,get5M86Y);
                -- elseif get5M86X1 ~= -1 then
                --     tap(get5M86X1,get5M86Y1);
                -- end
            
                pConfig.pLoginGet5ToTxt()
                break;
            else 
                pConfig.createTxt("没刀.txt");
                pConfig.removeFileList("860.txt");
                break;
            end
        end
        
        
    end
    

    
    -- 判断有没有卷
    -- 先删除当前条
    -- 如果有卷就创建一个新的文件 860 10天5刀
    
end


-- 这个函数控制着 点击完验证码后关闭 首页的广告
function pConfig.pLoginGet5()
    mSleep(1000)
    
    -- while (true) do
    --     mSleep(6000)
        
    --     local loginSYred86X,loginSYred86Y = findImage("img/login-shouye-red.png",14,45,739,504);
    --     if loginSYred86X ~= -1 and loginSYred86Y ~= -1 then
    --         pConfig.removeFileList("860.txt") 
    --         lua_restart()
    --     end
        
        

        
    --     local loginShow86X,loginShow86Y = findImage("img/login-shouye-me-show-8.6.png.png",120,121,618,306);
    --     mSleep(10)
    --     toast(loginShow86X .. "show")
        
    --     -- local loginHidden86X,loginhidden86Y = findImage("img/login-shouye-me-hidden-8.6.png",120,121,618,306);
    --     -- mSleep(10)
    --     -- toast(loginHidden86X .. "hidden")
        
        
    --     -- local loginSYShow86X,loginSYShow86Y = findImage("img/login-shouye-me-show-8.6.png",129,113,608,318);
    --     -- toast(loginSYShow86X .. "show")
    --     -- local loginSYHide86X,loginSYHide86Y = findImage("img/login-shouye-me-hidden-8.6.png",129,113,608,318);
    --     -- toast(loginSYHide86X .. "heid")
    --     -- if (loginSYShow86X ~= -1 and loginSYShow86Y ~= -1) or (loginSYHide86X ~= -1 and loginSYHide86Y ~= -1)  then
    --     --     toast("首页页面")
    --     --     mSleep(1000)
    --     --     break;
    --     -- end
    -- end
    mSleep(15000)
    -- while (true) do
    -- -- 超时重启脚本函数
    -- pConfig.timeOut()
        
        
    -- 关闭首页的弹窗
    -- local loginFirstItem86X,loginFirstItem86Y = findImage("img/login-fristItem-8.6.png",3,1110,203,1307);
    -- mSleep(5000)
        
    -- if loginFirstItem86X ~= -1 and loginFirstItem86Y ~= -1  then

    -- mSleep(10000)
    -- while (true) do
    --     local loginSY86X1,loginSY86Y1 = findImage("img/login-shouyeHead1-8.6.png",9,585,738,1070);
    --     toast(loginSY86X1 .. "caonima" )
    -- end
    -- toast("首页页面");
    while (true) do
        mSleep(3000)
        
        
        
        local loginNotNow86X,loginNotNow86Y = findImage("img/login-notNow-8.6.png",186,1135,644,1316);
        if loginNotNow86X ~= -1 and loginNotNow86Y ~= -1   then
            tap(loginNotNow86X + 5 ,loginNotNow86Y + 2)
            mSleep(5000)
        end
        
        local loginSY86X,loginSY86Y = findImage("img/login-shouyeHead1-8.6.png",68,678,731,1162);

        if loginSY86X ~= -1 and loginSY86Y ~= -1 then
            local loginSYClose86X,loginSYClose86Y = findImage("img/login-shouye-colse-8.6.png",581,360,744,620);
            
            if loginSYClose86X ~= -1 and loginSYClose86Y ~= -1   then 
                tap( loginSYClose86X,loginSYClose86Y);
                mSleep(5000)
                local loginRed86X,loginRed86Y = findImage("img/login-shouye-red.png",10,125,746,456);
                if loginRed86X ~= -1 and loginRed86Y ~= -1   then 
                    toast("报红 重启")
                    pConfig.removeFileList("860.txt") 
                    lua_restart()
                end
                break;
            end
        end
        
        local loginRed86X,loginRed86Y = findImage("img/login-shouye-red.png",10,125,746,456);
        if loginRed86X ~= -1 and loginRed86Y ~= -1   then 
            pConfig.removeFileList("860.txt") 
            lua_restart()
        end
        
        local loginShow86X,loginShow86Y = findImage("img/login-shouye-me-show-8.6.png",148,132,612,302);
        if loginShow86X ~= -1 and loginShow86Y ~= -1   then
            -- toast("welcome")
            mSleep(5000)
            break;
        end
        
        local loginWB86X,loginWB86Y = findImage("img/login-welcomeBack-8.6.png",148,132,612,302);
        if loginWB86X ~= -1 and loginWB86Y ~= -1   then
            -- toast("welcome back")
            mSleep(5000)
            break;
        end
        
        local loginThere86X,loginThere86Y = findImage("img/login-there-8.6.png",148,132,612,302);
        if loginThere86X ~= -1 and loginThere86Y ~= -1   then
            -- toast("there")
            mSleep(5000)
            break;
        end
        
        local loginAddPhone86X,loginAddPhone86Y = findImage("img/login-addPhone-8.6.png",5,216,740,861);
        if loginAddPhone86X ~= -1 and loginAddPhone86Y ~= -1   then 
            toast("出现加电话页面 重启")
            pConfig.removeFileList("860.txt") 
            lua_restart()
        end
        
        local loginNetErr86X,loginNetErr86Y = findImage("img/login-netErr-8.6.png",3,45,735,185);
        local loginNetErr86X1,loginNetErr86Y1 = findImage("img/login-netErr1-8.6.png",3,45,735,185);
        if (loginNetErr86X ~= -1 and loginNetErr86Y ~= -1 )or  (loginNetErr86X1 ~= -1 and loginNetErr86Y1 ~= -1 )   then
            lua_restart()
        end
    end
    -- else 
    --     break;
    -- end
        
    -- end
    
    mSleep(2000);
    pConfig.pLoginGet5Action()
end