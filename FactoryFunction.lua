-- 找到文件函数并且读取数据 
-- findFile 返回一个{} 里面是 电话数据 或者 ssn数据
function pConfig.findFile(txt) 
   
    --将指定文件中的内容按行读取
    function readFile(path)
        local file = io.open(path,"r");
        if file then
            local _list = {};
            for l in file:lines() do
                table.insert(_list,l)
            end
            file:close();
            return _list
        end
    end
    --检测指定文件是否存在
    function file_exists(file_name)
        local f = io.open(file_name, "r")
        return f ~= nil and f:close()
    end
    
    local data = ""
    local bool = file_exists(userPath().."/res/" .. txt)
    if bool then
        -- list 中取到的是第一条数据
        local list = tostring(readFile(userPath().."/res/" .. txt)[1])
        -- 判断是注册还是登录 返回不同的数据
        if pConfig.type == "注册7.42.3" or pConfig.type == "注册8.6.1" then
            data = list:split("|");
        elseif  pConfig.type == "领取8.6" then
            data = list:split("----");
        end
        return data
    else
        mSleep(5000)
        toast("文件不存在",0)
    end
 
end


-- 删除数据
function pConfig.removeFileList(txt) 
    --   local filePath =  txt;

    function readFile(file)
        assert (file, "file open failed" )
        local fileTab = {}
        local line = file:read()
        while  line  do
            table.insert(fileTab,line)
            line = file:read()
        end
        return  fileTab
    end
 
    function writeFile1(file,fileTab)
        assert (file, "file open failed" )

        for  i,line in ipairs(fileTab)  do
            file:write(line)
            file:write( "\n" )
        end
    end
 

    local fileRead = io.open(userPath().."/res/" .. txt);
    if  fileRead then
        local tab = readFile(fileRead)
        fileRead:close()
        table.remove(tab,1)
        local fileWrite = io.open(userPath().."/res/" .. txt, "w" )
        if  fileWrite then
            writeFile1(fileWrite,tab)
            fileWrite:close()
        end
    end

end


-- 创建文件并且写入文件
function pConfig.createTxt(txt1)
    
    
    -- "注册成功.txt"
    local day =os.date("%m/%d");
    if txt1 == "注册成功.txt" then 
        writeFile( 
            userPath().."/res/" .. txt1, 
            {pConfig.userMail .. "----" .. pConfig.PPPassword .. "----" .. ssnData[1] .. "|" .. ssnData[2] .. "|" .. ssnData[3] .. "|" .. ssnData[4] .. "|" .. ssnData[5] .. "|" .. ssnData[6] .. "|" .. ssnData[7] .. "|" .. ssnData[8]    },
            "a",
            1
            ) --将 table 内容存入文件，成功返回 true
    elseif txt1 == "10天有5刀.txt" and  pConfig.type == "领取8.6" then
        local loginData = pConfig.findFile("860.txt");
        writeFile( 
            userPath().."/res/" .. txt1, 
            { loginData[1] .. "----" .. loginData[2] .. "----" .. loginData[3] .. "----" ..day.."领取5刀" },
            "a",
            1
            ) --将 table 内容存入文件，成功返回 true
    elseif txt1 == "10天有5刀.txt" and  pConfig.type == "注册8.6.1" then
        writeFile( 
            userPath().."/res/" .. txt1, 
            {pConfig.userMail .. "----" .. pConfig.PPPassword .. "----" .. ssnData[1] .. "|" .. ssnData[2] .. "|" .. ssnData[3] .. "|" .. ssnData[4] .. "|" .. ssnData[5] .. "|" .. ssnData[6] .. "|" .. ssnData[7] .. "|" .. ssnData[8] .. "----" ..day.."领取5刀"   },
            "a",
            1
            ) --将 table 内容存入文件，成功返回 true
    elseif txt1 == "可能有再跑一次.txt" and pConfig.type == "领取8.6" then
        local loginData = pConfig.findFile("860.txt");
        writeFile( 
            userPath().."/res/" .. txt1, 
            { loginData[1] .. "----" .. loginData[2] .. "----" .. loginData[3]  },
            "a",
            1
            ) --将 table 内容存入文件，成功返回 true
    elseif txt1 == "可能有再跑一次.txt" and pConfig.type == "注册8.6.1" then
        writeFile( 
            userPath().."/res/" .. txt1, 
            {pConfig.userMail .. "----" .. pConfig.PPPassword .. "----" .. ssnData[1] .. "|" .. ssnData[2] .. "|" .. ssnData[3] .. "|" .. ssnData[4] .. "|" .. ssnData[5] .. "|" .. ssnData[6] .. "|" .. ssnData[7] .. "|" .. ssnData[8]    },
            "a",
            1
            ) --将 table 内容存入文件，成功返回 true
        
    elseif txt1 == "没刀.txt" and pConfig.type == "领取8.6" then
        local loginData = pConfig.findFile("860.txt");
        writeFile( 
            userPath().."/res/" .. txt1, 
            { loginData[1] .. "----" .. loginData[2] .. "----" .. loginData[3] .. "----" ..day.."没刀"},
            "a",
            1
            ) --将 table 内容存入文件，成功返回 true
    elseif txt1 == "没刀.txt" and pConfig.type == "注册8.6.1" then
        writeFile( 
            userPath().."/res/" .. txt1, 
            {pConfig.userMail .. "----" .. pConfig.PPPassword .. "----" .. ssnData[1] .. "|" .. ssnData[2] .. "|" .. ssnData[3] .. "|" .. ssnData[4] .. "|" .. ssnData[5] .. "|" .. ssnData[6] .. "|" .. ssnData[7] .. "|" .. ssnData[8] .. "----" ..day.."没刀"   },
            "a",
            1
            ) --将 table 内容存入文件，成功返回 true
        
    end
    
end



--  转化电话网址函数
-- 文本中入去的电话网址不能直接使用  要转换一下
function pConfig.encodeURL(phoneURL)
    jie = json.encode(phoneURL)
    fang = string.gsub(jie,"\\r","")
    phoneUrl =json.decode(fang); 
    mSleep(50);
    return phoneUrl;
end




















-- if res ~= nil and code == 200 then
--             -- 获取验证码
--             resbool = pcall( function () 
--                 res = json.decode(res);
--             end )
--             if resbool == true then

--                 local str = "";
--                 if   ( type(res) == "string" and string.len(res) > 12 ) or ( res.message ~= "" and res.message ~= "error" )   then
--                     -- if string.len(res.message) >  8  then
--                     if ( type(res) == "string" and string.len(res) > 12 ) then
--                         str= res
--                     elseif res.message ~= "" then 
--                         str = res.message;
--                     else
--                     end
--                     mSleep(50)
--                     for pc in string.gmatch(str, "%d+") do
--                         if string.len(phoneCode) < 6 then
--                             phoneCode = phoneCode .. pc;
--                             mSleep(50)
--                         end
--                     end
--                     -- phoneCode 是验证码
--                     mSleep(1000);
--                     local codeX,codeY = findImage("codeImg.png",9,412,744,828);
--                     if codeX ~= -1 and codeY ~= -1 then
                        
--                         tap(codeX,codeY);
--                         mSleep(50);
--                         -- inputText(phoneCode);
--                         inputKey(phoneCode);
--                         mSleep(50);
--                         return;
--                     end  
                        
                        
--                 else 
--                     local sendAgainX,sendAgainY = findImage("sendAgain.png",6,593,737,844);
--                     if sendAgainX ~= -1 and sendAgainY ~= -1 then
--                         tap(sendAgainX,sendAgainY);
--                         toast("点击 again")
--                         mSleep(2000)
--                     end
--                 end
                    
--             end
--         else 
--             local sendAgainX,sendAgainY = findImage("sendAgain.png",6,593,737,844);
--             if sendAgainX ~= -1 and sendAgainY ~= -1 then
--                 tap(sendAgainX,sendAgainY);
--                 toast("点击 again")
--                 mSleep(2000)
--             end
--         end 