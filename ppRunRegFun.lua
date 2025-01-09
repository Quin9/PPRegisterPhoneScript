require "pLoginFun";



-- 第一步 找到注册按钮
function  pConfig:ppRegFindSingup()
    local banbentype = "";

    while (true) do 
        -- 超时重启脚本函数
        pConfig.timeOut()
        if pConfig.type == "注册7.42.3" then
            banbentype = "img/signUp7.42.3.png";
            -- dialog("1")
        elseif pConfig.type == "注册8.6.1" then
            banbentype = "img/signUp8.6.1.png";
            nexttype = "img/sendAgain8.6.1.png"
            -- dialog("12")
        end
        mSleep(3000)
        -- local signUpOffX,signUpOffY = findImage(banbentype,11,1177,740,1328); 
        local signUpOffX,signUpOffY = findImage(banbentype,18,1201,738,1324);
        -- 登录有两个界面
        local signUpOffX2,signUpOffY2 = findImage("img/signUp7.42.3(2).png",18,1201,738,1324);
        -- dialog(signUpOffX)
        
        mSleep(10)
        if (signUpOffX ~= -1 and signUpOffY ~= -1 )  then 
            toast("注册",3);
            randomTap(signUpOffX,signUpOffY,3)
            break;
        elseif (signUpOffX2 ~= -1 and signUpOffY2 ~= -1 )  then 
            toast("注册",3);
            randomTap(signUpOffX2,signUpOffY2,3)
            break;
        end
        
        
    end
end

-- 第二步  找到电话文本框进行操作
function pConfig:ppRegFindPhone()
    local sendAgaintype = ""
    nextImg = ""
    local phoneCodeError = ""
    
    if pConfig.type == "注册7.42.3" then
        nextImg = "img/registerNext7.42.3.png";
        sendAgaintype = "img/sendAgain.png"
        phoneCodeError = "img/phoneCodeErr-7.42.3.png"
    elseif pConfig.type == "注册8.6.1" then
        nextImg = "img/registerNext8.6.1.png";
        sendAgaintype = "img/sendAgain8.6.1.png"
        phoneCodeError = "img/phoneCodeErr-8.6.1.png"
        phoneCodeError1 = "img/phoneCodeErr1-8.6.1.png"
    end
    
    local phoneData = {};
    while (true) do 
        -- 超时重启脚本函数
        pConfig.timeOut()
        phoneData = pConfig.findFile("phone.txt");
        if phoneData ~= nil then
            break;
        end
    end
    -- 输入电话点击确认按钮
   
    mSleep(1000)
    
    while (true) do
                mSleep(4000)

        -- 超时重启脚本函数
        pConfig.timeOut()
        
        tap(656,623);
        mSleep(500)
        tap(656,623);
        if pConfig.type == "注册8.6.1" then
            for var = 1,12 do
                --删除输入框中的文字（假设输入框中已存在文字）
                randomTap(629,1280,3);
                --iOS 设备连续输入建议加下延时时间，否则可能因为速度太快导致输入错误
                mSleep(20)
            end
        end
       
        -- touchDown(470,625);    
        -- mSleep(30);
        -- --在坐标 (150, 550) 抬起
        -- touchUp(470,625);
        
        -- for var = 1,15 do
        mSleep(2000);
        -- inputKey(phoneData[1]);
        toast(phoneData[1])
        inputKey(phoneData[1],100);
        -- end
        mSleep(2000);
       
       

        local phoneNextX,phoneNextY = findImage(nextImg,12,661,744,1327);
        if phoneNextX ~= -1 and phoneNextY ~= -1 then 
            mSleep(1000);
            randomTap(phoneNextX,phoneNextY,3)
            mSleep(3000);
            
            
            
            
            -- 判断 是不是 voip电话

            local voipX,voipY = findImage("img/voip.png",26,628,705,770);
            if voipX ~= -1 and voipY ~= -1 then
                randomTap(470,625,3);
                mSleep(1000);
                for var = 1,10 do
                    --删除输入框中的文字（假设输入框中已存在文字）
                    randomTap(629,1280,3);
                    --iOS 设备连续输入建议加下延时时间，否则可能因为速度太快导致输入错误
                    mSleep(20)
                end
                inputKey("7788888888",100);
                mSleep(1000);
                local phoneNextX1,phoneNextY1 = findImage(nextImg,15,677,741,890);
                if phoneNextX1 ~= -1 and phoneNextY1 ~= -1 then 
                    mSleep(1000);
                    randomTap(phoneNextX1,phoneNextY1,3)
                    mSleep(1000);
                    
                    -- 关闭wifi
                    setWifiEnable(false);
                    mSleep(2000);
                    -- 返回输入电话页
                    randomTap(58,83,3);
                    mSleep(4000);
                    
                    randomTap(470,625,3);
                    mSleep(1000);
                    for var = 1,10 do
                        --删除输入框中的文字（假设输入框中已存在文字）
                        randomTap(629,1280,3);
                        --iOS 设备连续输入建议加下延时时间，否则可能因为速度太快导致输入错误
                        mSleep(20)
                    end
                    
                    mSleep(1000);
                    -- 再次输入电话
                    randomTap(470,625,3);
                    mSleep(1000);
                    inputKey(phoneData[1],100);
                    
                    mSleep(1000);
                    randomTap(phoneNextX1,phoneNextY1,3)
                    
                    -- 开启wifi
                    setWifiEnable(true);
                    mSleep(500);

                end 
            end
            
            mSleep(8000)
            -- 开始写正常接码程序
            local sendAgainX,sendAgainY = findImage(sendAgaintype,11,303,734,1028);
            if sendAgainX ~= -1 and sendAgainY ~= -1 then
                randomTap(sendAgainX,sendAgainY,3);
                toast("点击 again")
                
                -- 一直点击 重新发送代码
                -- while (true) do
                --     local phoneFailX,phoneFailY = findImage("phoneFail.png",8,121,747,327);
                --     if sendAgainX ~= -1 and sendAgainY ~= -1 then
                --         tap(sendAgainX,sendAgainY);
                --         mSleep(500)
                --     else 
                --         break;
                --     end
                -- end
                break;
            end
            mSleep(1000)
            
        end 

    end 
    
    mSleep(1000);
       

    phoneUrl = pConfig.encodeURL(phoneData[2]);

    mSleep(6000)
    local phoneTimeOut = os.time();
    -- 循环获取电话code
    phoneCode = "";
    while (true) do 
        if os.difftime(os.time(), phoneTimeOut) > (tonumber(pConfig.phoneTimer) * 60) then
            toast("来电超时！ 重新运行",3)
            -- 来电超时之后 删除这个电话号
            pConfig.removeFileList("phone.txt") 
            lua_restart()
        end
        
        -- 超时重启脚本函数
        pConfig.timeOut()
        local res, code = http.request( phoneUrl );
        toast(res,2)
        -- 这个if 表示网页相应
        if res ~= nil and code == 200 then
            -- 获取验证码
            resbool = pcall( function () 
                res = tostring(res);
            end )
            if resbool == true then
                if   string.len(res) > 70    then
                    mSleep(50)
                    
                    for pc in string.gmatch(res, "[^%d](%d%d%d%d%d%d)[^%d/-]") do
                        phoneCode = phoneCode .. pc;
                        mSleep(50)
                    end
                    -- phoneCode 是验证码
                    mSleep(1000);
                    local codeX,codeY = findImage("img/codeImg.png",9,412,744,828);
                    if codeX ~= -1 and codeY ~= -1 then
                        
                        randomTap(codeX,codeY,3);
                        mSleep(50);
                        -- inputKey(phoneCode);
                        inputKey(phoneCode,100);
                        mSleep(2050);
                        
                        local phonecodeErrX,phonecodeErrY = findImage(phoneCodeError,40,299,731,835);
                        local phonecodeErrX1,phonecodeErrY1 = findImage(phoneCodeError1,40,299,731,835);
                        if (phonecodeErrX ~= -1 and phonecodeErrY ~= -1 ) or (phonecodeErrX1 ~= -1 and phonecodeErrY1 ~= -1 ) then
                            pConfig.removeFileList("phone.txt") 
                            lua_restart()
                        end
                        -- 电话接码成功后删除电话
                        -- pConfig.removeFileList("phone.txt") 
                        return;
                    end  
                        
                        
                else 
                    local sendAgainX,sendAgainY = findImage(sendAgaintype,11,303,734,1028);
                    toast(sendAgainX .. "找到了重新发送按钮")

                    if sendAgainX ~= -1 and sendAgainY ~= -1 then
                        randomTap(sendAgainX,sendAgainY,3);
                        toast("点击 again1")
                        mSleep(30000)
                    end
                end
            end
        end 
        
        
        
    end

end





-- 第三步 填写ssn
function pConfig.ppRegWriteSSN()
    local ssnFirst = "";
    local ssnimg = "";
    if pConfig.type == "注册7.42.3" then
        ssnFirst = "img/ssn-first-7.42.3.png";
        ssnimg ="img/ssn7.42.3.png";
    elseif pConfig.type == "注册8.6.1" then
        ssnFirst = "img/ssn-first-8.6.1.png"
        ssnimg ="img/ssn8.6.1.png"
    end
    
    -- 获取ssn
    ssnData = {};
    while (true) do 
        -- 超时重启脚本函数
        pConfig.timeOut()
        ssnData = pConfig.findFile("ssn.txt");
        -- ssnData[1]  firstName;
        -- ssnData[2]  lastName;
        -- ssnData[3]  stree;
        -- ssnData[4]  city and state;
        -- ssnData[5]  city;
        -- ssnData[6]  zip;
        -- ssnData[7]  birthday;
        -- ssnData[8]  ssnPhone;

        if ssnData ~= nil then
            break;
        end
    end
    mSleep(2000)
    while (true) do
        -- 超时重启脚本函数
        pConfig.timeOut()
        
        -- 判断是不是ssn页面
        local ssnX,ssnY = findImage(ssnimg,11,108,739,642);
        local ssnX1,ssnY1 = findImage(ssnimg,11,108,739,642);
        -- dialog(signUpOffX)
        
        mSleep(10)
        if (ssnX ~= -1 and ssnY ~= -1) or  (ssnX1 ~= -1 and ssnY1 ~= -1)  then 
            toast("ssn 页面",2);
            mSleep(500)
            
            local ssnFirstX,ssnFirstY = findImage(ssnFirst,7,266,737,713);

            -- 判断找到第一行输入名字信息 之后y轴需要 +5 确保点位正确
            if ssnFirstX ~= -1 and ssnFirstY ~= -1   then
                mSleep(500)
                randomTap(ssnFirstX,ssnFirstY,3);
                mSleep(1000);
                -- first姓名文本框
                toast(ssnData[1])
                inputKey(ssnData[1],100);
                -- inputKey("123a1sd35");
                mSleep(1000)
                
                local iphone6SKeyboardNextX,iphone6SKeyboardNextY = findImage("img/iphone6S-keyboard-next.png",467,1191,748,1331);
                local iphone6SKeyboardNextX1,iphone6SKeyboardNextY1 = findImage("img/iphone6S-keyboard-next1.png",467,1191,748,1331);

                if (iphone6SKeyboardNextX ~= -1 and iphone6SKeyboardNextY ~= -1) then
                    -- 找到 6s 键盘的 next键点击 进去下一行
                    randomTap(iphone6SKeyboardNextX,iphone6SKeyboardNextY,3);
                    mSleep(1000);
                elseif (iphone6SKeyboardNextX1 ~= -1 and iphone6SKeyboardNextY1 ~= -1)  then
                    randomTap(iphone6SKeyboardNextX1,iphone6SKeyboardNextY1,3);
                    mSleep(1000);
                end
                
                pConfig.userMail = ssnData[1] .. os.time() .. pConfig.EmailRight;
                
                
                -- last 姓名文本框
                toast(ssnData[2])
                inputKey(ssnData[2],100);
                mSleep(1000);
                if (iphone6SKeyboardNextX ~= -1 and iphone6SKeyboardNextY ~= -1) then
                    -- 找到 6s 键盘的 next键点击 进去下一行
                    randomTap(iphone6SKeyboardNextX,iphone6SKeyboardNextY,3);
                    mSleep(1000);
                elseif (iphone6SKeyboardNextX1 ~= -1 and iphone6SKeyboardNextY1 ~= -1)  then
                    randomTap(iphone6SKeyboardNextX1,iphone6SKeyboardNextY1,3);
                    mSleep(1000);
                end
                -- 邮箱文本框
                toast(pConfig.userMail)
                inputKey(pConfig.userMail,100);
                mSleep(1000);
                if (iphone6SKeyboardNextX ~= -1 and iphone6SKeyboardNextY ~= -1) then
                    -- 找到 6s 键盘的 next键点击 进去下一行
                    randomTap(iphone6SKeyboardNextX,iphone6SKeyboardNextY,3);
                    mSleep(1000);
                elseif (iphone6SKeyboardNextX1 ~= -1 and iphone6SKeyboardNextY1 ~= -1)  then
                    randomTap(iphone6SKeyboardNextX1,iphone6SKeyboardNextY1,3);
                    mSleep(1000);
                end
                -- 密码文本框
                inputKey(pConfig.PPPassword,100);
                -- mSleep(500);
                -- tap(iphone6SKeyboardNextX,iphone6SKeyboardNextY);
                mSleep(3000);
                
                -- ssn页面的next 按钮
                local ssnNextX,ssnNextY = findImage(nextImg,13,721,741,1326);
                if ssnNextX ~= -1 and ssnNextY ~= -1 then 
                    randomTap( ssnNextX,ssnNextY,3  )
                    
                    mSleep(4000)
                    break;
                end
            end
        end
        
        
    end
end




-- 第四步 填写地址
function pConfig.ppRegWriteStree()
    local addStreetBool = "";
    local addStreetBtn = "";
    local dontSeeStreet = "";
    local addStreetBtnBlock = "";
    
    if pConfig.type == "注册7.42.3" then
        addStreetBool = "img/addStreet-7.42.3.png"
        addStreetBtn = "img/addStreetBtn-7.42.3.png"
        dontSeeStreet = "img/address-dontSee-7.42.3.png"
        addStreetBtnBlock = "img/addStreetBlockBtn-7.42.3.png"
        addStreetnextBtn = "img/addStreet-next-7.42.3.png"
    elseif pConfig.type == "注册8.6.1" then
        addStreetBool = "img/addStreet-8.6.1.png"
        addStreetBtn = "img/addStreetBtn-8.6.1.png"
        dontSeeStreet = "img/address-dontSee-8.6.1.png"
        addStreetBtnBlock = "img/addStreetBlockBtn-8.6.1.png"
        addStreetnextBtn = "img/addStreet-next-8.6.1.png"
    end
    -- 确认是不是填写地址页面
    
            
    while (true) do
        mSleep(2000)
        -- 超时重启脚本函数
        pConfig.timeOut()
        

        local addStreetBoolX,addStreetBoolY = findImage(addStreetBool,12,121,588,407);
        toast(addStreetBoolX .. "地址页面" );
        if addStreetBoolX ~= -1 and addStreetBoolY ~= -1 then 
            -- 地址页面点击
            local addStreetBtnX,addStreetBtnY = findImage(addStreetBtn,25,460,713,868);
            toast(addStreetBtnX .. "地址")
            if addStreetBtnX ~= -1 and addStreetBtnY ~= -1 then 
                tap(addStreetBtnX,addStreetBtnY+2);
                mSleep(1000)
                inputText(ssnData[3]);
                
                mSleep(6000);
                break;
                
            end
        end
    end
        
    mSleep(2000);
    while (true) do
        pConfig.timeOut()
        -- 地址输入玩出现的列表 点击右侧的 right按钮
        toast("li")
        local addStreetRightBtnX,addStreetRightBtnY = findImage("img/addStreet-right-7.42.3.png",21,160,742,390);
        local addStreetRightBtnX1,addStreetRightBtnY1 = findImage("img/addStreet-right-8.6.1.png",21,160,742,390);
        -- dialog(addStreetRightBtnX1 .."USA")
        
        local dontSeeStreetX,dontSeeStreetY = findImage(dontSeeStreet,11,278,715,394);
        if dontSeeStreetX ~= -1 and dontSeeStreetY ~= -1 then 
            pConfig.removeFileList("ssn.txt");
            lua_restart();
        end
        
        if pConfig.type == "注册7.42.3" then
            if addStreetRightBtnX ~= -1 and addStreetRightBtnY ~= -1 then 
                randomTap(addStreetRightBtnX-10,addStreetRightBtnY+5,3);
                mSleep(1000);
                break;
            end
        elseif pConfig.type == "注册8.6.1" then
            if addStreetRightBtnX1 ~= -1 and addStreetRightBtnY1 ~= -1 then
                toast("tap")
                tap(addStreetRightBtnX1,addStreetRightBtnY1);
                break;
            end
        end
        
        
        
        
        
        
        
        
                
    end
                
    mSleep(2000);
    -- 点击正方形按钮
    while (true) do
        -- 超时重启脚本函数
        pConfig.timeOut()
            
        -- 这里应该添加一个判断地址爆红的错误
        -- 直接重新运行删掉ssn
        local streetErrX,streetErrY = findImage("img/streetErr-7.42.3.png",11,54,735,388);
        if streetErrX ~= -1 and streetErrY ~= -1 then 
            pConfig.removeFileList("ssn.txt");
            lua_restart();
        end
            
            
        local addStreetBtnBlockX,addStreetBtnBlockY = findImage(addStreetBtnBlock,6,726,183,1047);
        toast( addStreetBtnBlockX.."block" )
        if addStreetBtnBlockX ~= -1 and addStreetBtnBlockY ~= -1 then 
            tap(addStreetBtnBlockX + 3,addStreetBtnBlockY + 3);
            mSleep(2000);
                
            -- addStreet-next-7.42.3.png
            local addStreetnextBtnX,addStreetnextBtnY = findImage(addStreetnextBtn,2,555,735,1315);
            if addStreetnextBtnX ~= -1 and addStreetnextBtnY ~= -1 then
                randomTap(addStreetnextBtnX,addStreetnextBtnY,3);
                break;
            end
        end
    end


end



-- 第五步 绑卡等后续操作
function pConfig.ppRegCardNext()
    local card = ""
    
    if pConfig.type == "注册7.42.3" then
        cardPath = "img/card-7.42.3.png"
    elseif pConfig.type == "注册8.6.1" then
        cardPath = "img/card-8.6.1.png"
    end
    
    
    mSleep(2000)
    while (true) do
        -- 超时重启脚本函数
        pConfig.timeOut()
        mSleep(2000);
        local cardX,cardY = findImage(cardPath,10,144,732,520);
        -- 判断是不是绑卡页面
        if cardX ~= -1 and cardY ~= -1 then 
            toast("绑卡页面");
            -- 找到skip的按钮
            mSleep(2000)
            local cardSkipX,cardSkipY = findImage("img/card-skip-7.42.3.png",615,54,746,124);
            if cardSkipX ~= -1 and cardSkipY ~= -1 then 
                randomTap( cardSkipX + 30,cardSkipY + 10,3  );
                break;
            end
        end
        
    end
    
    
    
    function phoneNot() 
        while (true) do
            mSleep(3000)
            -- 超时重启脚本函数
            pConfig.timeOut()
        
            -- 判断电话推送页面
            if pushPhoneX ~= -1 and pushPhoneY ~= -1 then 
            
                toast("电话推送页面");
                local pushPhoneNotNowX,pushPhoneNotNowY = findImage("img/pushPhone-notNow-7.42.3.png",125,1184,641,1318);
                -- 电话推送页面 not now 按钮
                if pushPhoneNotNowX ~= -1 and pushPhoneNotNowY ~= -1 then 
                    mSleep(1000)
                    randomTap( pushPhoneNotNowX + 5,pushPhoneNotNowY + 3,3 );
                    break;
                end
            end
        end
    end
   

    function gogowith() 
        local gowithNotBtn = "";
    
        if pConfig.type == "注册7.42.3" then
            gowithNotBtn = "img/goWithPP-not-7.42.3.png"
        elseif pConfig.type == "注册8.6.1" then
            gowithNotBtn = "img/gowithBtn-8.6.1.png"
        end
        
        while (true) do
            mSleep(3000)
            -- 超时重启脚本函数
            pConfig.timeOut()
            toast("go with PP");
            -- 判断pp注册最后一步
            toast(goWithPP86X .. "goWithPP86X")
            if  (goWithPPX ~= -1 and goWithPPY ~= -1) or (goWithPP86X ~= -1 and goWithPP86Y ~= -1) then 
                mSleep(4000)
                local goWithPPNotX,goWithPPNotY = findImage(gowithNotBtn,9,507,730,1305);
                -- explore your account;
                if goWithPPNotX ~= -1 and goWithPPNotY ~= -1 then 
                    mSleep(1000)
                    tap( goWithPPNotX + 5,goWithPPNotY + 3 );
                    return;
                end
            end
            
        end
    end
    

    while (true) do
        mSleep(3000)
        local loginNotNow86X,loginNotNow86Y = findImage("img/login-notNow-8.6.png",186,1135,644,1316);
        if loginNotNow86X ~= -1 and loginNotNow86Y ~= -1   then
            tap(loginNotNow86X + 5 ,loginNotNow86Y + 2)
            mSleep(5000)
        end
        -- 超时重启脚本函数
        pConfig.timeOut()
        -- 有的手机没有phone not now 步骤 写一个判断
        local pushPhoneX,pushPhoneY = findImage("img/pushPhone-7.42.3.png",7,144,734,507);
        local goWithPPX,goWithPPY = findImage("img/goWithPP-7.42.3.png",11,852,723,1300);
        goWithPP86X,goWithPP86Y = findImage("img/gowith-8.6.1.png",52,86,687,233);
        local loginSY86X,loginSY86Y = findImage("img/login-shouyeHead1-8.6.png",68,678,731,1162);
        local loginNotNow86X,loginNotNow86Y = findImage("img/login-notNow-8.6.png",186,1135,644,1316);
        
        
        if pushPhoneX ~= -1 and pushPhoneY ~= -1 then 
            phoneNot()
            gogowith() 
            return;
        elseif (goWithPPX ~= -1 and goWithPPY ~= -1) or (goWithPP86X ~= -1 and goWithPP86Y ~= -1)  then 
            gogowith() 
            return;
        elseif loginSY86X ~= -1 and loginSY86Y ~= -1 then
            return
        end
    end
   
    
    
end




-- 第六步  注册成功 
function pConfig.ppRegOk()
    mSleep(5000);
    toast("进入注册页面")
    local loginRed86X1,loginRed86Y1 = findImage("img/login-shouye-red1.png",12,136,738,343);
    local ppRegFailX,ppRegFailX = findImage("img/ppRegFail.png",3,40,744,358);

    if pConfig.type == "注册7.42.3" then
        if ppRegFailX == -1 and ppRegFailX == -1 then
            -- 注册成功后写入成功的信息
            -- toast("!red")
            pConfig.createTxt("注册成功.txt");
            mSleep(500)
        end
    elseif pConfig.type == "注册8.6.1" then
        if loginRed86X1 == -1 and loginRed86Y1 == -1 then
            -- 注册成功后写入成功的信息
            -- toast("!red")
            pConfig.createTxt("注册成功.txt");
            mSleep(500)
        end
    end
    
    
    -- 删除第一条ssn
    pConfig.removeFileList("ssn.txt");
    mSleep(500)
    pConfig.removeFileList("phone.txt");
    mSleep(500)
    
    
    if pConfig.type == "注册8.6.1" then
        pConfig.pLoginGet5()
    end
    -- 领取5刀步骤
end