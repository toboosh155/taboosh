--[[
الالعاب ل سورس روي
تم تعديل الملف واضافه الالعاب من قب طبوش (@Moe555)
--]]
local function games(msg,MsgText)
if msg.type ~= "pv" then
if MsgText[1] == "تفعيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" or MsgText[2] == "العاب كوين" then
if not msg.Admin then return "• ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not redis:get(max..'lock_geams'..msg.chat_id_) then 
return "• ** أهلا عزيزي "..msg.TheRankCmd.."\n• ** الالعاب بالتاكيد تم تفعيلها\n" 
else 
redis:del(max..'lock_geams'..msg.chat_id_) 
return "• ** أهلا عزيزي "..msg.TheRankCmd.."\n• ** تم تفعيل الالعاب \n" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" or MsgText[2] == "كوين" then
if not msg.Admin then return "• ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if redis:get(max..'lock_geams'..msg.chat_id_) then 
return "• ** أهلا عزيزي "..msg.TheRankCmd.."\n• ** الالعاب بالتأكيد معطله\n" 
else
redis:set(max..'lock_geams'..msg.chat_id_,true)  
return "• ** أهلا عزيزي "..msg.TheRankCmd.."\n• ** تم تعطيل الالعاب\n" 
end   
end
if MsgText[1] == "اضف رسائل" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then 
return "• ** هذا الامر يخص {المطور,المنشئ} فقط  \n" 
end 
local ID_USER = MsgText[2]
redis:set(max..'SET:ID:USER'..msg.chat_id_,ID_USER)  
redis:setex(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*• ارسل لي عدد الرسائل الذي تريده*')
end
if MsgText[1] == "اضف نقاط" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then 
return "• ** هذا الامر يخص {المطور,المنشئ} فقط  \n" 
end 
local ID_USER = MsgText[2]
redis:set(max..'SET:ID:USER:NUM'..msg.chat_id_,ID_USER)  
redis:setex(max.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*• ارسل لي عدد النقاط الذي تريده*')
end
if not redis:get(max..'lock_geams'..msg.chat_id_) and msg.GroupActive then
if MsgText[1] == 'اسئله' or MsgText[1] == 'ختيارات' or MsgText[1] == 'بدء الاسئله' then   
redis:set(max.."GAME:S"..msg.chat_id_,true) 
t1 = [[
ماهو اطول نهر في العالم 
1- النيل  
2- الفرات 
3- نهر الكونغو


• ارسل  الجواب الصحيح فقط
]]
t2 = [[
ماعدد عظام الوجه?
1- 15
2- 13
3- 14 

• ارسل  الجواب الصحيح فقط
]]
t3 =[[
كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون?

1- الفم 
2- الاذن
3- الثلاجه


• ارسل  الجواب الصحيح فقط
]]
t4 =[[
كم جزء تحتوي مسلسل وادي الذئاب?

1- 7
2- 15
3- 11


• ارسل  الجواب الصحيح فقط
]]
t5 =[[
كم جزء يحتوي القران الكريم?

1- 60
2- 70
3- 30 


• ارسل  الجواب الصحيح فقط
]]
t6 =[[
من هوه اغنى رئيس في العالم??

1- ترامب
2- اوباما
3- بوتين  


• ارسل  الجواب الصحيح فقط
]]

t7 =[[
من هوه مؤسس شركه ابل العالميه 

1-لاري بايج 
2- بيا غايتز
3- ستيف جوبر


• ارسل  الجواب الصحيح فقط
]]
t8 =[[
ماهي عاصمه فرنسا?

1- باريس 
2- لوين 
3- موسكو 


• ارسل  الجواب الصحيح فقط
]]
t9 =[[
ماعدد دول العربيه التي توجد في افريقيا 

1- 10 
2- 17
3- 9

• ارسل  الجواب الصحيح فقط
]]
t11 =[[
ماهو الحيوان الذي يحمل 50 فوق وزنه ?
1-الفيل
2- النمل  
3- الثور


• ارسل  الجواب الصحيح فقط
]]
t12 =[[
ماذا يوجد بيني وبينك؟  
1- الضل
2- الاخلاق
3-حرف الواو  


• ارسل  الجواب الصحيح فقط
]]
t13 =[[
ماهو الشيء النبات ينبت للانسان بلا بذر؟
1-الاضافر 
2- الاسنان
3- الشعر


• ارسل  الجواب الصحيح فقط
]]
t14 =[[
من هو اول الرسول الى الارض؟
1- ادم
2- نوح
3-ابراهيم 


• ارسل  الجواب الصحيح فقط
]]
t15 =[[
ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين؟
1- سحاب
2- بئر
3- نهر


• ارسل  الجواب الصحيح فقط
]]
t16 =[[
ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا؟
1- العمر
2- ساعه
3- الاسم


• ارسل  الجواب الصحيح فقط
]]
t17 =[[
اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم
1- نحاس
2- الماس
3- ذهب


• ارسل  الجواب الصحيح فقط
]]
t18 =[[
في الليل ثلاثة لكنه في النهار واحده فما هو
 1- حرف الباء
 2- حرف الام 
3- حرف الراء


• ارسل  الجواب الصحيح فقط
]]
t19 =[[
على قدر اصل العزم تأتي?
1- العزائم 
2- المكارم
3- المبائب


• ارسل  الجواب الصحيح فقط
]]

t20 =[[
ماهي جمع كلمه انسه ?
1- سيدات
2- انسات 
3- قوانص


• ارسل  الجواب الصحيح فقط
]]
t21 =[[
اله استعملت قديماً في الحروب?
1- الصاروخ
2- المسدس
3- المنجنيق 


• ارسل  الجواب الصحيح فقط
]]
t22 =[[
تقع لبنان في قاره?
1- افريقيا 
2- اسيا  
3- امركيا الشماليه


• ارسل  الجواب الصحيح فقط
]]

t23 =[[
1- ماهو الحيوان الذي يلقب بملك الغابه?
1-الفيل
2- الاسد 
3- النمر


• ارسل  الجواب الصحيح فقط
]]
t24 =[[
كم صفر للمليون ?
1- 4 
2- 3
3-6

• ارسل  الجواب الصحيح فقط
]]
t25 =[[
ما اسم صغير الحصان?
1- مهر  
2- جرو
3- عجل


• ارسل  الجواب الصحيح فقط
]]
t26 =[[
ما الحيوان الذي ينام واحدى عينه مفتوحه?

1- القرش
2- الدلفين 
3- الثعلب


• ارسل  الجواب الصحيح فقط
]]
t27 =[[
ماهي القاره التي تلقب بالقاره العجوز?

1- امريكا الشماليه 
2- امريكا الجنوبيه
3- افريقيا 


• ارسل  الجواب الصحيح فقط
]]
t28 =[[
ما اسم المعدن الموجود فيي الحاله السائله 

1- النحاس 
2- الحديد
3- الزئبق  


• ارسل  الجواب الصحيح فقط
]]
t29 =[[
ماهي عاصمه انجلترا?
1- لندن  
2- لفرسول
3- تركيا


• ارسل  الجواب الصحيح فقط
]]
t30 =[[
ماهو الشئ الذي برأسه سبع فتحات

1- الهاتف
2- التلفاز
3- الانسان 


• ارسل  الجواب الصحيح فقط
]]
t31 =[[
ماهي عاصمه اليابان ?
1- بانكول
2- نيو دلهي
3- طوكيو 


• ارسل  الجواب الصحيح فقط
]]
t32 =[[
من هي زوجه الرسول الاكبر منه سنآ?

1- حفضه
2- زينب 
3- خديجه 


• ارسل  الجواب الصحيح فقط
]]
TAHA = {t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15}
local SENDTEXT = TAHA[math.random(#TAHA)]
if SENDTEXT:find('النيل') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'النيل') 
elseif SENDTEXT:find('14') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'14') 
elseif SENDTEXT:find('الفم') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'الفم') 
elseif SENDTEXT:find('11') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'11') 
elseif SENDTEXT:find('30') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'30') 
elseif SENDTEXT:find('بوتين') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'بوتين') 
elseif SENDTEXT:find('ستيف جوبر') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'ستيف جوبر') 
elseif SENDTEXT:find('باريس') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'باريس') 
elseif SENDTEXT:find('10') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'10') 
elseif SENDTEXT:find('النمل') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'النمل') 
elseif SENDTEXT:find('حرف الواو') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'حرف الواو') 
elseif SENDTEXT:find('الشعر') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'الشعر') 
elseif SENDTEXT:find('ابراهيم') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'ابراهيم') 
elseif SENDTEXT:find('سحاب') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'سحاب') 
elseif SENDTEXT:find('الاسم') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'الاسم') 
elseif SENDTEXT:find('ذهب') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'ذهب') 
elseif SENDTEXT:find('حرف الام') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'حرف الام') 
elseif SENDTEXT:find('العزائم') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'العزائم') 
elseif SENDTEXT:find('انسات') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'انسات') 
elseif SENDTEXT:find('المنجنيق') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'المنجنيق') 
elseif SENDTEXT:find('اسيا') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'اسيا') 
elseif SENDTEXT:find('الاسد') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'الاسد') 
elseif SENDTEXT:find('6') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'6') 
elseif SENDTEXT:find('مهر') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'مهر') 
elseif SENDTEXT:find('الدلفين') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'الدلفين') 
elseif SENDTEXT:find('اوروبا') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'اوروبا') 
elseif SENDTEXT:find('الزئبق') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'الزئبق') 
elseif SENDTEXT:find('لندن') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'لندن') 
elseif SENDTEXT:find('الانسان') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'الانسان') 
elseif SENDTEXT:find('طوكيو') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'طوكيو') 
elseif SENDTEXT:find('خديجه') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'خديجه') 
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'المختلف' then
katu = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','✨','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅',
};
name = katu[math.random(#katu)]
redis:set(max..':Set_alii:'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'✨','💫💫💫💫💫✨💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂','🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙍‍♂🙎‍♂🙎‍♂🙎‍♂')
name = string.gsub(name,'🧖‍♂','🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♂🧖‍♀🧖‍♀🧖‍♀🧖‍♀')
name = string.gsub(name,'👬','👭👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📆📅📆📆')
return '  اول واحد يطلع المختلف » {* '..name..' * } ' 
end

if MsgText[1] == 'امثله' then
katu = {
'سبقني','الصقر','الفصيح','عون','الدله','يعرفك','السواهي','بعين','الخيل','عدوك','النخله','علقو','الطير','محبته','حجته','القط','قسمه','الفوت','الزمان','مخابر',
};
name = katu[math.random(#katu)]
redis:set(max..':Set_Amthlh:'..msg.chat_id_,name)
name = string.gsub(name,'وسبقني','ضربني وبكاء .... وشتكى')
name = string.gsub(name,'الصقر','الي ما يعرف .... يشويه')
name = string.gsub(name,'يعرفك','الي ما .... ما يثمنك')
name = string.gsub(name,'عون','جبتك .... صرتلي فرعون')
name = string.gsub(name,'الدله','اقلب .... على فمها تطلع البنت على امها')
name = string.gsub(name,'النخله','الطول طول .... والعقل عقل الصخلة')
name = string.gsub(name,'السواهي','تحت .... دواهي')
name = string.gsub(name,'بعين','القرد .... امه غزال')
name = string.gsub(name,'عدوك','خاف من .... مره ومن صديقك الف مره')
name = string.gsub(name,'قبل','الجار .... الدار')
name = string.gsub(name,'الفصيح','الديك .... من البيضه يصيح')
name = string.gsub(name,'علقو','المنحوس منحوس لو .... على راسه فانوس')
name = string.gsub(name,'محبته','الي تتغير ... تتغير مخدته')
name = string.gsub(name,'حجته','الغايب .... معه')
name = string.gsub(name,'القط','اذا غاب .... اللعب يا فار')
name = string.gsub(name,'قسمه','الجيزة .... ونصيب')
name = string.gsub(name,'الفوت','اذا فات .... ما ينفع الصوت')
name = string.gsub(name,'الزمان','اذا ما طاعك .... طيعه')
name = string.gsub(name,'الطير','اذا كان فيه .... ما رماه الطير')
name = string.gsub(name,'مخابر','الرجال .... مو مناظر')
return 'اكمل المثل التالي {* '..name..' *}'
end

if MsgText[1] == 'رياضيات' then
katu = {
'95','399','144','119','-2','9','8','55','511','114','877','153','509','932','211','7','67','143','515','515',
};
name = katu[math.random(#katu)]
redis:set(max..':Set_Amthlh:'..msg.chat_id_,name)
name = string.gsub(name,'95','12+83')
name = string.gsub(name,'399','491-92')
name = string.gsub(name,'9','3+6')
name = string.gsub(name,'119','37+82')
name = string.gsub(name,'-2','5+18-25')
name = string.gsub(name,'877','300+827-250')
name = string.gsub(name,'8','2+7-1')
name = string.gsub(name,'55','36+19')
name = string.gsub(name,'114','6+8+100')
name = string.gsub(name,'143','62+72')
name = string.gsub(name,'144','62+82')
name = string.gsub(name,'153','72+81')
name = string.gsub(name,'932','566+566-200')
name = string.gsub(name,'211','139+72')
name = string.gsub(name,'7','6+7-6')
name = string.gsub(name,'67','55+12')
name = string.gsub(name,'515','514+1')
name = string.gsub(name,'515','100+415')
name = string.gsub(name,'511','500+11')
name = string.gsub(name,'509','500+9')
return 'أجب الجواب الصحيح {* '..name..' *}'
end

if MsgText[1] == 'انقليزي' or MsgText[1] == 'الانقليزي' then
  katu = {
  'افتح','باب','الافضل','جدار','طيران','ورده','جيد','سيء','اريد','غريب','خطير','يهتم','حفظ','تحرك','ربما','ثقه','حقيقه','صندوق','يد','شجاع','هادئ','حذر','مرح','ذكي','جبان','مجنون','عاطفي','ودود','مضحك','كريم','صادق','غير صبور','غير مهذب','حنون','كسول','حقير','مريض',
  };
  name = katu[math.random(#katu)]
  redis:set(max..':Set_Amthlh:'..msg.chat_id_,name)
  name = string.gsub(name,'افتح','Open')
  name = string.gsub(name,'باب','Door')
  name = string.gsub(name,'الافضل','Best')
  name = string.gsub(name,'جدار','Wall')
  name = string.gsub(name,'طيران','Fly')
  name = string.gsub(name,'ورده','Flower')
  name = string.gsub(name,'جيد','Good')
  name = string.gsub(name,'سيء','Bay')
  name = string.gsub(name,'اريد','Want')
  name = string.gsub(name,'غريب','Stranger')
  name = string.gsub(name,'خطير','Dangerous')
  name = string.gsub(name,'يهتم','Care')
  name = string.gsub(name,'حفظ','Save')
  name = string.gsub(name,'تحرك','Move')
  name = string.gsub(name,'ربما','Maybe')
  name = string.gsub(name,'ثقه','Trust')
  name = string.gsub(name,'حقيقه','Truth')
  name = string.gsub(name,'صندوق','Box')
  name = string.gsub(name,'يد','Hand')
  name = string.gsub(name,'شجاع','Brave')
  name = string.gsub(name,'هادئ','Calm')
  name = string.gsub(name,'حذر','Cautious')
  name = string.gsub(name,'مرح','Cheerful')
  name = string.gsub(name,'ذكي','Clever')
  name = string.gsub(name,'جبان','Cowardly')
  name = string.gsub(name,'مجنون','Crazy')
  name = string.gsub(name,'عاطفي','Emotional')
  name = string.gsub(name,'ودود','Friendly')
  name = string.gsub(name,'مضحك','Funny')
  name = string.gsub(name,'كريم','Generous')
  name = string.gsub(name,'صادق','Honest')
  name = string.gsub(name,'غير صبور','Impatient')
  name = string.gsub(name,'غير مهذب','Impolite')
  name = string.gsub(name,'حنون','Kind')
  name = string.gsub(name,'كسول','Lazy')
  name = string.gsub(name,'حقير','Mean')
  name = string.gsub(name,'مريض','Patient')
  return 'اجب على معنى الكلمة {* '..name..' *}'
  end

if MsgText[1] == 'تفكيك' then
  katu = {
  'ا ح ب ك','ب ا ب','ذ ئ ب','ب ع ي ر','ط ي ر','و ر د ه','ج م ي ل ','ح ل و','ب ط ر ي ق','ط م ا ط م','م و ز','س ي ا ر ة','ت ح ر ي ك','ف ل و س','ب و ت','ث ق ة','ح ل ز و ن','م ك ي ف','م ر و ح ه',
  };
  name = katu[math.random(#katu)]
  redis:set(max..':Set_Amthlh:'..msg.chat_id_,name)
  name = string.gsub(name,'احبك','ا ح ب ك')
  name = string.gsub(name,'ا ك ر ه ك','اكرهك')
  name = string.gsub(name,'ذ ئ ب','ذئب')
  name = string.gsub(name,'ب ع ي ر','بعير')
  name = string.gsub(name,'ط ي ر','طير')
  name = string.gsub(name,'و ر د ه','ورده')
  name = string.gsub(name,'ج م ي ل','جميل')
  name = string.gsub(name,'ح ل و','حلو')
  name = string.gsub(name,'ب ط ر ي ق','بطريق')
  name = string.gsub(name,'ط م ا ط م','طماطم')
  name = string.gsub(name,'م و ز','موز')
  name = string.gsub(name,'س ي ا ر ة','سيارة')
  name = string.gsub(name,'ت ح ر ي ك','تحريك')
  name = string.gsub(name,'ف ل و س','فلوس')
  name = string.gsub(name,'ب و ت','بوت')
  name = string.gsub(name,'ث ق ة','ثقة')
  name = string.gsub(name,'ح ل ز و ن','حلزون')
  name = string.gsub(name,'م ك ي ف','مكيف')
  name = string.gsub(name,'م ر و ح ه','مروحه')
  return 'اسرع واحد يفكك {* '..name..' *}'
  end

if MsgText[1] == 'الالغاز' or MsgText[1] == 'لغز' then
  katu = {
  'الصوره','100','الرمانه','الهواء','22','خلية النحل','الابره','بيت العنكبوت','الذكريات','البوصلة','البطريق','البحر','الفلفل','الاخلاق','السيارة','غلط','كوكب الارض','ادم وحواء','عطار',
  };
  name = katu[math.random(#katu)]
  redis:set(max..':Set_lgz:'..msg.chat_id_,name)
  name = string.gsub(name,'الصوره','شيء يُؤخذ منك قبل أن يُعطى لك فما هو ؟')
  name = string.gsub(name,'100','عشرة و عشرتين، ومثلهم مرتين، وخمسة و ثلاثة و اثنين، كم صارو؟')
  name = string.gsub(name,'الرمانه','طاسة ترن طاسة، في البحر غطاسة، من جوه لولو و من بره نحاسة؟')
  name = string.gsub(name,'الهواء','ما هو الشيء الذي يخترق الغابات والأشجار والأشواك دون أن يتحرك؟')
  name = string.gsub(name,'22','كم مرة ينطبق عقربا الساعة على بعضهما في اليوم الواحد؟')
  name = string.gsub(name,'خلية النحل','يتسع لمئات الألوف ولا يتسع للطير المنتوف؟')
  name = string.gsub(name,'الابره','ما هو الشيء الذي له عين واحدة ولكنه لا يرى؟')
  name = string.gsub(name,'بيت العنكبوت','ما هو أضعف البيوت على وجه الأرض؟')
  name = string.gsub(name,'الذكريات','شيء دائماً تفعله كثيراً وكلما فعلته تركته خلفك، فما هو؟')
  name = string.gsub(name,'البوصلة','بنت حافت الأرض حوف لأنها تعرف جميع الاتجاهات، مسكنها في الوسط وتنام إذا نام صاحبها، فمن هي؟')
  name = string.gsub(name,'البطريق','شيء يسير في البحر، يمشي في البر، عنده جناحين ولكن لا يطير، فما هو؟')
  name = string.gsub(name,'الفلفل','ما هو الشيء الذي يُقشر من الداخل ويؤكل من الخارج؟')
  name = string.gsub(name,'الاخلاق','شيء معروف عالميًا، مهم ومحترم، وفي نفس الوقت يُهان، فما هو؟')
  name = string.gsub(name,'السيارة','شيء أشتريه بمالي و لا أدخله داري فما هو؟')
  name = string.gsub(name,'غلط','ما هي الكلمة الوحيدة التي تُلفظ غلط دائمًا؟')
  name = string.gsub(name,'كوكب الارض','ما هو الكوكب الذي يُرى في الليل و النهار؟')
  name = string.gsub(name,'ادم وحواء','إنسان وزوجته لا هو من بني آدم و لا هي من بنات حواء؟')
  name = string.gsub(name,'عطار','تاجر من التجار إذا اقتلعنا عينه طار، فمن هو؟')
  return 'اول شخص يحل اللغز {* '..name..' *}'
  end

if MsgText[1] == 'حزوره' then
katu = {'امي','انا','المخده','الهواء','الهواء','القمر','المقفل','النهر','الغيم','اسمك','حرف الام','الضابط','الدائره','الجمعة','ابل','الصمت','السلحفات','كم الساعه','شجره العائله','ضفدع','خليه النحل','الصوت','الجوع','الكتاب','البيض','الاسفنجه','البرتقال','الكفن','الساعه','الطاولة','البصل','الوقت','النار','الثلج','العمر','المسمار','الحفره','المشط','الجوال','الجرس','المراه','الغداء','الفيل','الصدى','الهواء','عقرب الساعه'};
name = katu[math.random(#katu)]
redis:set(max..':Set_Hzorh:'..msg.chat_id_,name)
name = string.gsub(name,'امي','اخت خالك ومهي خالتك منهي؟')
name = string.gsub(name,'انا','ورع امك وورع ابوك ومهي اختك ولاخوك منهو؟')
name = string.gsub(name,'المخده','انا خفيفه وانا لطيفه اقعد بحضن الخليفه أزيح الهموم  واخلي الحييب نايم من انا؟')
name = string.gsub(name,'الهواء','ماهو الشيء الذي يسير امامك ولا تراه؟')
name = string.gsub(name,'القمر','ماهو الشيء الذي يحيا اول الشهر ويموت في اخره؟')
name = string.gsub(name,'المقفل','وش الباب الي ما يمديك تفتحه؟')
name = string.gsub(name,'النهر','ماهو الشي الذي يجري ولا يمشي؟')
name = string.gsub(name,'الغيم','ماهو الشي الذي يمشي بلا رجلين ويبكي بلا عيون؟')
name = string.gsub(name,'اسمك','ماهو الشيء الذي لك ويستخدمه الناس من دون اذنك؟')
name = string.gsub(name,'حرف الام','ماهو الشيء الذي تراه في الليل ثلاث مرات والنهار مره واحده؟')
name = string.gsub(name,'الضابط','رجوله في الارض وراسه فوق النجوم؟')
name = string.gsub(name,'الدائره','ماهو الشيء الذي ليس له بدايه وليس له نهاية؟')
name = string.gsub(name,'الجمعة','لدينا ثلاث أعياد ليس عيد الفطر وليس عيد الاضحى فما هو؟')
name = string.gsub(name,'ابل','تفاحة ماكول نصها وش هي؟')
name = string.gsub(name,'الصمت','ماهي الكلمه الذي يبطل معناها اذا نطقت بها؟ ')
name = string.gsub(name,'السلحفاة','ماهو الذي لحمهه من الداخل وعضمهه من الخارج؟ ')
name = string.gsub(name,'كم الساعه','ماهوه السؤال الذي تختلف اجابته دائماً؟')
name = string.gsub(name,'شجره العائله','ما اسم الشجره التي ليس لها ضل ولا لها ثمار؟ ')
name = string.gsub(name,'الضفدع','ماهو الحيوان الذي لسانه طويل وجسمه صغير؟')
name = string.gsub(name,'خليه النحل','ماهو الشيء الذي يتسع مئاات الالوف ولا يتسع طير منتوف؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا ب الاذنين؟')
name = string.gsub(name,'الجوع','ماهو الشيء الذي يقرصك ولا تراه؟')
name = string.gsub(name,'الكتاب','له اوراق وما هو بنبات، له جلد وماهو بحيوان . وعلم وماهو ب انسان من هو؟')
name = string.gsub(name,'البيض','ماهو الشي الذي اسمه على لونه؟')
name = string.gsub(name,'الاسفنجه','كلي ثقوب ومع ذالك احفظ الماء فمن انا؟ ')
name = string.gsub(name,'البرتقال','ماهو الشيء نرميه بعد العصر؟')
name = string.gsub(name,'الكفن','ماهو الشيء لاتحب ان تلبسة وان لبستة لاترة؟')
name = string.gsub(name,'الساعه','ماهو الشيء الذي يمشي ويقف وليس له ارجل؟')
name = string.gsub(name,'الطاولة','اننا اربعة اخوه ولنا راس واحد فمن نحن؟')
name = string.gsub(name,'البصل','شيء تذبحه وتبكي عليه؟')
name = string.gsub(name,'الوقت','يذهب ولا يرجع؟')
name = string.gsub(name,'النار','شيء ياكل ولايشبع وان شرب الماء مات؟')
name = string.gsub(name,'الثلج','شيء مصنوع من الماء وان عاش في الماء يموت؟')
name = string.gsub(name,'العمر','ماهو الشيء الذي كلما زاد نقص؟')
name = string.gsub(name,'المسمار','ماهو الشيء الذي لا يمشي الا ب الضرب؟')
name = string.gsub(name,'الحفره','ماهو الشيء الذي كلما اخذنا منهه زاد وكبر؟')
name = string.gsub(name,'المشط','له اسنان ولا يعض ماهو؟ ')
name = string.gsub(name,'الجوال','يسمع بلا اذن ويحكي بلا لسان فما هو؟')
name = string.gsub(name,'الجرس','ماهو الشيء الذي اذا لمسته صاح؟')
name = string.gsub(name,'المراه','ارى كل شيء من دون عيون فمن اكون؟')
name = string.gsub(name,'الغداء','ماهو الشيء الذي لايؤكل في الليل؟ ')
name = string.gsub(name,'الفيل','من هوه الحيوان الذي يحك اذنه في انفه؟')
name = string.gsub(name,'الصدى','ماهو الشيء الذي يتكلم جميع اللغات؟ ')
name = string.gsub(name,'الهواء','شيء بيني وبينك لا تراه عينك ولا عيني فما هوه؟')
name = string.gsub(name,'عقرب الساعه','هناك عقرب لا يلدغ ولا يخاف منه الاطفال فما هوه؟')
return '  اول واحد يحلها » {* '..name..' *} ' 
end


if MsgText[1] == 'محيبس' or MsgText[1] == 'بات' then   
Num = math.random(1,6)
redis:set(max.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊


• اختر لأستخراج المحيبس أليد التي تحمل المحيبس 
• الفائز يحصل على { 3 } من النقاط *
]]
sendMsg(msg.chat_id_,msg.id_,TEST)   
redis:setex(max.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
if MsgText[1] == 'خمن' or MsgText[1] == 'تخمين' then   
Num = math.random(1,20)
redis:set(max.."GAMES:NUM"..msg.chat_id_,Num) 
TEST = '*\n• اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n'..'• ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n'..'• سيتم تخمين عدد ما بين ال {1 - 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ \n*'
sendMsg(msg.chat_id_,msg.id_,TEST)
redis:setex(max.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
if (MsgText[1] == 'اسرع' or MsgText[1] == 'الاسرع') then
local NUM = math.random(10,1000)
redis:set(max..':NUM_SET:'..msg.chat_id_,(NUM * 3))
local Smiles = {'🍏','🍎','🍐',NUM,NUM,NUM,NUM,NUM,'🍊','🍋','🍌','🍉',NUM,NUM,NUM,NUM,NUM,'🍇','🍓','🍈','🍒',NUM,NUM,NUM,NUM,NUM,'🍑','🍍','🥥','🥝','🍅',NUM,NUM,NUM,NUM,NUM,'🍆','🥑','🥦','🥒',NUM,NUM,NUM,NUM,NUM,'🌶','🌽','🥕','🥔','🍠','🥐','🍞',NUM,NUM,NUM,NUM,NUM,'🥖','🥨','🧀','🥚','🍳','🥞','🥓',NUM,NUM,NUM,NUM,NUM,'🥩','🍗','🍖','🌭','🍔','🍟',NUM,NUM,NUM,NUM,NUM,'🍕','🥪','🥙','🍼','☕️','🍵',NUM,NUM,NUM,NUM,NUM,'🥤','🍶','🍺','🍻',NUM,NUM,NUM,NUM,NUM,'🏀','⚽️','🏈','⚾️','🎾','🏐',NUM,NUM,NUM,NUM,NUM,'🏉','🎱','🏓','🏸','🥅','🎰','🎮',NUM,NUM,NUM,NUM,NUM,'🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹',NUM,NUM,NUM,NUM,NUM,'🎼','🎧','🎤','🎬','🎨','🎭',NUM,NUM,NUM,NUM,NUM,'🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌',NUM,NUM,NUM,NUM,NUM,'🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌',NUM,NUM,NUM,NUM,NUM,'📍','📓','📗','📂','📅','📪','📫','📬',NUM,NUM,NUM,NUM,NUM,'📭','⏰','📺','🎚','☎️',NUM,NUM,NUM,NUM,NUM,'📡'}
Emoji = Smiles[math.random(#Smiles)]
redis:set(max..':Set_Smile:'..msg.chat_id_,Emoji)
if tonumber(redis:get(max..':Set_Smile:'..msg.chat_id_)) == tonumber(redis:get(max..':NUM_SET:'..msg.chat_id_)) then
return 'اول من يكتب ذي يفوز ⬅︎`'..(redis:get(max..':Set_Smile:'..msg.chat_id_))..'`'
else
return '️اول من يكتب ذي يفوز ⬅︎    `'..(redis:get(max..':Set_Smile:'..msg.chat_id_))..'`'
end
end
if MsgText[1] == 'ترتيب' then
katu = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','قهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','كوين','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = katu[math.random(#katu)]
redis:set(max..':Set_Arg:'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ي ف ا')
name = string.gsub(name,'بزونه','ز و ب ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ث ل ا')
name = string.gsub(name,'قهوه','ه ق ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ا ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
name = string.gsub(name,'كوين','ك ر د و')
return '  اسرع واحد يرتبها {* '..name..' *} ' 
end
if MsgText[1] == 'معاني' then
katu = {'قرد','حصان','ارنب','حيه','نمله','قطه','كلب','ثور','ماعز','خروف','سلحفاه','حوت','ورده','نخله','شجره','شمس','هلال','كامره','حلزون','مسدس','طياره','سياره','كرز','بطيخ','فراوله','منزل','كوره','نجمه','ساعه','راديو','باب','قارب','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
redis:set(max..':Set_Name_Meant:'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'حصان','🐎')
name = string.gsub(name,'ارنب','🐇')
name = string.gsub(name,'حيه','🐍')
name = string.gsub(name,'نمله','🐜')
name = string.gsub(name,'قطه','🐈')
name = string.gsub(name,'كلب','🐕')
name = string.gsub(name,'ثور','🐂')
name = string.gsub(name,'ماعز','🐐')
name = string.gsub(name,'خروف','🐏')
name = string.gsub(name,'سلحفاه','🐢')
name = string.gsub(name,'حوت','🐳')
name = string.gsub(name,'ورده','🌷')
name = string.gsub(name,'نخله','🌴')
name = string.gsub(name,'شجره','🌳')
name = string.gsub(name,'شمس','🌞')
name = string.gsub(name,'هلال','🌙')
name = string.gsub(name,'كامره','📷')
name = string.gsub(name,'كامره','📹')
name = string.gsub(name,'حلزون','🐌')
name = string.gsub(name,'مسدس','🔫')
name = string.gsub(name,'طياره','🚁')
name = string.gsub(name,'سياره','🚘')
name = string.gsub(name,'كرز','🍒')
name = string.gsub(name,'بطيخ','🍉')
name = string.gsub(name,'فراوله','🍓')
name = string.gsub(name,'منزل','🏫')
name = string.gsub(name,'كوره','⚽')
name = string.gsub(name,'نجمه','🌟')
name = string.gsub(name,'ساعه','🕞')
name = string.gsub(name,'راديو','📻')
name = string.gsub(name,'باب','🚪')
name = string.gsub(name,'قارب','⛵')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
return '• اول من يكتب معنى السمايل يفوز { '..name..' }'
end
if MsgText[1] == 'عكس' or MsgText[1] == 'العكس' or MsgText[1] == 'العكسس' then   
redis:set(max.."GAME:S"..msg.chat_id_,true) 
H1 = [[
• عكس كلمه » {مافهمت} .
]]
H2 = [[
• عكس كلمه » {خايف} .
]]
H3 =[[
• عكس كلمه » {ميت} .
]]
H4 =[[
• عكس كلمه » {كسول} .
]]
H5 =[[
• عكس كلمه » {زين} .
]]
H6 =[[
• عكس كلمه » {عطشان} .
]]

H7 =[[
• عكس كلمه » {بارده} .
]]
H8 =[[
• عكس كلمه » {خايف} .
]]
H9 =[[
• عكس كلمه » {امام} .
]]
H11 =[[
• عكس كلمه » {خاين} .
]]
H12 =[[
• عكس كلمه » {طويل} .
]]
H13 =[[
• عكس كلمه » {صلب} .
]]
H14 =[[
• عكس كلمه » {ناعم} .
]]
H15 =[[
• عكس كلمه » {مجنون} .
]]
H16 =[[
• عكس كلمه » {غبي} .
]]
H17 =[[
• عكس كلمه » {ظلمه} .
]]
H18 =[[
• عكس كلمه » {مسموح} .
]]
H19 =[[
• عكس كلمه » {ماسمعك} .
]]

H20 =[[
• عكس كلمه » {تعال} .
]]
HUSSEIN = {H16,H17,H18,H19,H20,H1,H2,H3,H4,H5,H6,H7,H8,H9,H11,H12,H13,H14,H15}
local SENDTEXT = HUSSEIN[math.random(#HUSSEIN)]
if SENDTEXT:find('فهمت') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'فهمت') 
elseif SENDTEXT:find('شجاع') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'شجاع') 
elseif SENDTEXT:find('حي') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'حي') 
elseif SENDTEXT:find('نشيط') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'نشيط') 
elseif SENDTEXT:find('مو زين') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'مو زين') 
elseif SENDTEXT:find('مو عطشان') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'مو عطشان') 
elseif SENDTEXT:find('حاره') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'حاره') 
elseif SENDTEXT:find('مو خايف') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'مو خايف') 
elseif SENDTEXT:find('خلف') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'خلف') 
elseif SENDTEXT:find('وفي') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'وفي') 
elseif SENDTEXT:find('قزم') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'قزم') 
elseif SENDTEXT:find('لين') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'لين') 
elseif SENDTEXT:find('خشن') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'خشن') 
elseif SENDTEXT:find('عاقل') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'عاقل') 
elseif SENDTEXT:find('ذكي') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'ذكي') 
elseif SENDTEXT:find('مو ظلمه') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'مو ظلمه') 
elseif SENDTEXT:find('ممنوع') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'مو ممنوع') 
elseif SENDTEXT:find('اسمعك') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'اسمعك') 
elseif SENDTEXT:find('روح') then
redis:set(max.."GAME:CHER"..msg.chat_id_,'روح') 
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'نقاطي' then 
local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
return '*• عدد النقاط التي ربحتها هي » { '..points..' }\n• تسطيع بيع نقاطك ولحصول على (100) رساله مقابل كل نقطه من النقاط *\n'
else
return ' *• ليس لديك نقاط ،\n• للحصول على النقاط ،\n• ارسل الالعاب وابدأ اللعب ! *'
end
end
if MsgText[1] == 'بيع نقاطي' then
if MsgText[2] == "0" then
return '• هناك خطأ عزيزي  \n• يجب ان يكون البيع ع الاقل 1 من النقاط . 'end
local points = redis:get(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if tonumber(MsgText[2]) > tonumber(points) then
return '• ليس لديك النقاط بهذا العدد' 
end
if points == "0" then
return '• للاسف ليس لديك النقاط \n• للحصول على النقاط العب احد الالعاب الموجوده في `قائمه الالعاب`'
else
local Total_Point = MsgText[2] * 100
redis:decrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,MsgText[2])  
redis:incrby(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_,Total_Point)  
return "• تم خصم {* "..MsgText[2].." *} من نقاطك\n• تم زياده {* "..Total_Point.."* } من الرسائل \n• اصبحت رسائلك { *"..redis:get(max..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_).."* } رساله\n• "
end
end
if MsgText[1] == "الالعاب" or MsgText[1] == "اللعبه" or MsgText[1] == "اللعبة" then
return [[ 
• الالعاب لبوت []]..redis:get(max..':NameBot:')..[[]🎖.
↓ ↓ ↓ ↓ 
•  امثله .
•  معاني .
•  اسئله .
•  روليت .
•  حزوره .
•  ترتيب .
•  العكس .
•  تخمين .
•  الاسرع .
•  محيبس .
•  المختلف .
•  رياضيات .
•  انقليزي .
•  تفكيك .
• كت تويت .
•  الالغاز .
‏
]]
end
if MsgText[1] == 'روليت' then
redis:del(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:del(max..':List_Rolet:'..msg.chat_id_)  
redis:setex(max..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_,3600,true)  
return '*• * حسناً , ارسل عدد اللاعبين .'
end
if MsgText[1] == 'نعم' and redis:get(max..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_) then
local list = redis:smembers(max..':List_Rolet:'..msg.chat_id_) 
if #list == 1 then 
return "• لم يكتمل العدد للاعبين" 
elseif #list == 0 then 
return "• لم تقوم باضافه اي لاعب" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
redis:incrby(max..':User_Points:'..msg.chat_id_..data.id_,5)
end,nil)
redis:del(max..':List_Rolet:'..msg.chat_id_) 
redis:del(max..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_)
return '• تم اختيار الشخص المحظوظ\n• صاحب الحظ {['..UserName..']}\n• ربحت معنا 5 نقاط' 
end
if MsgText[1] == 'الاعبين' then
local list = redis:smembers(max..':List_Rolet:'..msg.chat_id_) 
local Text = '\n*————————*\n' 
if #list == 0 then 
return '*• * لا يوجد لاعبين هنا ' 
end 
for k, v in pairs(list) do 
Text = Text..k.."•  » [" ..v.."] »\n"  
end 
return Text
end
if MsgText[1] == 'قائمه الالعاب' then
sendMsg(msg.chat_id_,msg.id_,[[
• الالعاب لبوت []]..redis:get(max..':NameBot:')..[[]🎖.
↓ ↓ ↓ ↓ 
•  امثله .
•  معاني .
•  اسئله .
•  روليت .
•  حزوره .
•  ترتيب .
•  العكس .
•  تخمين .
•  الاسرع .
•  محيبس .
•  المختلف .
•  رياضيات .
•  انقليزي .
•  تفكيك .
• كت تويت .
•  الالغاز .
‏‏
]])
end
end
end
end
local function procces(msg)
if msg.text and not redis:get(max..'lock_geams'..msg.chat_id_) then
if msg.text == redis:get(max..':Set_alii:'..msg.chat_id_) then -- // المختلف
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_alii:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت جبت الاختلاف الصحيح   \n*   \n')
end

if msg.text == redis:get(max..':Set_Amthlh:'..msg.chat_id_) then -- // امثله
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_Amthlh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت جبتها صح   \n*   \n')
end

if msg.text == redis:get(max..':Set_lgz:'..msg.chat_id_) then -- // لغز
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_lgz:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت حليت اللغز   \n*   \n')
end

if msg.text == redis:get(max..':Set_lgz:'..msg.chat_id_) then -- // الالغاز
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_lgz:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت حليت اللغز   \n*   \n')
end

if msg.text == redis:get(max..':Set_Amthlh:'..msg.chat_id_) then -- // رياضيات
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_Amthlh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت حليت المسائله الصحيحه   \n*   \n')
end

if msg.text == redis:get(max..':Set_Hzorh:'..msg.chat_id_) then -- // حزوره
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_Hzorh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت حليت الحزوره   \n*   \n')
end


if msg.text == redis:get(max..':Set_Smile:'..msg.chat_id_) then --//  الاسرع
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_Smile:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت انت اسرع واحد \n*   \n')
end 
if msg.text == redis:get(max..':Set_alii:'..msg.chat_id_) then -- // المختلف
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_alii:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت جبت الاختلاف الصحيح   \n*   \n')
end 
if msg.text == redis:get(max..':Set_Hzorh:'..msg.chat_id_) then -- // حزوره
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_Hzorh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت حليت الحزوره   \n*   \n')
end 
if msg.text == redis:get(max..':Set_Arg:'..msg.chat_id_) then -- // الترتيب
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_Arg:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت رتبتها   \n*   \n')
end 
if msg.text == redis:get(max..':Set_Name_Meant:'..msg.chat_id_) then --// المعاني
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max..':Set_Name_Meant:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• أحسنت جبت المعنى \n*   \n')
end 
if msg.text:match("^(%d+)$") and redis:get(max..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_) then  --// استقبال اللعبه الدمبله
if msg.text == "1" then
Text = "*• * لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
redis:set(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_,msg.text)  
Text = '• تم بدء تسجيل اللسته \n• يرجى ارسال المعرفات \n• الفائز يحصل على (5) مجوهره\n• عدد الاعبين المطلوبه { *'..msg.text..'* } لاعب \n'
end
redis:del(max..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_)  
return sendMsg(msg.chat_id_,msg.id_,Text)    
end
if msg.text:match('^(@[%a%d_]+)$') and redis:get(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) then    --// استقبال الاسماء
if redis:sismember(max..':List_Rolet:'..msg.chat_id_,msg.text) then
return sendMsg(msg.chat_id_,msg.id_,'*• * المعرف {['..msg.text..']} موجود اساساً' )
end
redis:sadd(max..':List_Rolet:'..msg.chat_id_,msg.text)
local CountAdd = redis:get(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_)
local CountAll = redis:scard(max..':List_Rolet:'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
redis:del(max..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:setex(max..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_,1400,true)  
return sendMsg(msg.chat_id_,msg.id_,"*• *تم ادخال المعرف { ["..msg.text.."] } \n• **وتم اكتمال العدد الكلي \n• هل انت مستعد؟ اجب بـ {* نعم *}")
end 
return sendMsg(msg.chat_id_,msg.id_,"*• * تم ادخال المعرف { ["..msg.text.."] } \n• تبقى { *"..CountUser.."* } لاعبين ليكتمل العدد\n• ارسل المعرف التالي ")
end
end 
if redis:get(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 99999999990 then
sendMsg(msg.chat_id_,msg.id_,"*• لا تستطيع اضافة اكثر من99999999990 رساله\n*")
redis:del(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = redis:get(max..'SET:ID:USER'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n• * تم اضافة له { "..msg.text.." }* رساله")
redis:incrby(max..'msgs:'..GET_IDUSER..':'..msg.chat_id_,msg.text)  
end
redis:del(max.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
end
if redis:get(max.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 99999999990 then
sendMsg(msg.chat_id_,msg.id_,"*• لا تستطيع اضافة اكثر من 99999999990 نقطه\n*")   
redis:del(max.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = redis:get(max..'SET:ID:USER:NUM'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n• * تم  اضافة له { "..msg.text.." }* نقطه")
redis:incrby(max..':User_Points:'..msg.chat_id_..GET_IDUSER,msg.text)  
end
redis:del(max.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_)  
end
if redis:get(max.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 6 then
sendMsg(msg.chat_id_,msg.id_,"*• لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخره*\n")   
return false  end 
local GETNUM = redis:get(max.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(max.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'*• مبروك فزت وطلعت المحيبس بل أليد رقم { '..NUM..' }\n• لقد حصلت على { 3 } من نقاط يمكنك استبدالها برسائل *')   
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:del(max.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'\n*• للاسف لقد خسرت \n• المحيبس بل أليد رقم { '..GETNUM..' }\n• حاول مره اخرى للعثور على المحيبس *')   
end
end
end
if (msg.text == redis:get(max.."GAME:CHER"..msg.chat_id_)) and redis:get(max.."GAME:S"..msg.chat_id_) then  
sendMsg(msg.chat_id_,msg.id_,'• اجابتك صحيحه ذكي وربي')     
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max.."GAME:S"..msg.chat_id_)
redis:del(max.."GAME:CHER"..msg.chat_id_)
elseif msg.text == 'الفيل' or msg.text == 'الثور' or msg.text == 'الحصان' or msg.text == '7' or msg.text == '9' or msg.text == '8' or msg.text == 'لوين' or msg.text == 'موسكو' or msg.text == 'مانكو' or msg.text == '20' or msg.text == '30' or msg.text == '28' or msg.text == 'ترامب' or msg.text == 'اوباما' or msg.text == 'كيم جونغ' or msg.text == '50' or msg.text == '70' or msg.text == '40' or msg.text == '7' or msg.text == '3' or msg.text == '10' or msg.text == '4' or msg.text == 'الاذن' or msg.text == 'الثلاجه' or msg.text == 'الغرفه' or msg.text == '15' or msg.text == '17' or msg.text == '25' or msg.text == 'الفرات' or msg.text == 'نهر الكونغو' or msg.text == 'المسيبي' or msg.text == 'بيا بايج' or msg.text == 'لاري بيج' or msg.text == 'بيا مارك زوكيربرج' or msg.text == 'الفيل' or msg.text == 'النمر' or msg.text == 'الفهد' or msg.text == 'بانكول' or msg.text == 'نيو دلهي' or msg.text == 'بيكن' or msg.text == 'الهاتف' or msg.text == 'التلفاز' or msg.text == 'المذياع' or msg.text == 'لفرسول' or msg.text == 'تركيا' or msg.text == 'بغداد' or msg.text == 'النحاس' or msg.text == 'الحديد' or msg.text == 'الفضه' or msg.text == 'امريكا الشماليه' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'القرش' or msg.text == 'الثعلب' or msg.text == 'الكلب' or msg.text == 'للجرو' or msg.text == 'العجل' or msg.text == 'الحمار' or msg.text == '3' or msg.text == '5' or msg.text == '6' or msg.text == 'اوربا' or msg.text == 'افريقيا' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'امريكا الشماليه' or msg.text == 'اوربا' or msg.text == 'الصاروخ' or msg.text == 'المسدس' or msg.text == 'الطائرات' or msg.text == 'سيدات' or msg.text == 'قوانص' or msg.text == 'عوانس' or msg.text == 'المكارم' or msg.text == 'المبائم' or msg.text == 'المعازم' or msg.text == 'حرف الغاء' or msg.text == 'حرف الواو' or msg.text == 'حرف النون' or msg.text == 'نحاس' or msg.text == 'الماس' or msg.text == 'حديد' or msg.text == 'العمر' or msg.text == 'ساعه' or msg.text == 'الحذاء' or msg.text == 'بئر' or msg.text == 'نهر' or msg.text == 'شلال' or msg.text == 'ادم' or msg.text == 'نوح' or msg.text == 'عيسئ' or msg.text == 'الاضافر' or msg.text == 'الاسنان' or msg.text == 'الدموع' or msg.text == 'الاخلاق' or msg.text == 'الضل' or msg.text == 'حرف النون'  then
if redis:get(max.."GAME:S"..msg.chat_id_) then  
local list = {'10' , 'براسي' , 'النمل' , '32' , 'بوتين' , '30' , '11' , 'الفم' , '14' , 'النيل' , 'ستيف جوبر' , 'خديجه' , 'الاسد' , 'طوكيو' , 'الانسان' , 'لندن' , 'الزئبق' , 'اورباالدولفين' , 'المهر' , '4' , 'اسيا' , 'اسيا' , 'المنجنيق' , 'انسات' , 'العزائم' , 'حرف الام' , 'ذهب' , 'الاسم' , 'سحاب' , 'ابراهيم' , 'الشعر' , 'حرف الواو'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id_,msg.id_,'• اجابتك غلط ')     
redis:del(max.."GAME:S"..msg.chat_id_)
redis:del(max.."GAME:CHER"..msg.chat_id_)
return false  
end
end
end
end
if (msg.text == redis:get(max.."GAME:CHER"..msg.chat_id_)) and redis:get(max.."GAME:S"..msg.chat_id_) then  
sendMsg(msg.chat_id_,msg.id_,'• اجابتك صحيحه ذكي وربي')     
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max.."GAME:S"..msg.chat_id_)
redis:del(max.."GAME:CHER"..msg.chat_id_)
elseif msg.text == 'فهمت' or msg.text == 'شجاع' or msg.text == 'عدل' or msg.text == 'نشيط' or msg.text == 'مو زين' or msg.text == 'مو عطشان' or msg.text == 'حاره' or msg.text == 'مو خايف' or msg.text == 'خلف' or msg.text == 'وفي' or msg.text == 'القزم' or msg.text == 'لين' or msg.text == 'خشن' or msg.text == 'عاقل' or msg.text == 'ذكي' or msg.text == 'مو ظلمه' or msg.text == 'ممنوع' or msg.text == 'اسمعك' or msg.text == 'روح' then
if redis:get(max.."GAME:S"..msg.chat_id_) then  
local list = {'فهمت' , 'شجاع' , ' مو عطشان' , 'عدل' , 'نشيط' , 'مو زين' , ' حاره ' , 'خلف' , 'مو خايف' , 'لين' , 'القزم' , 'وفي' , 'عاقل' , 'خشن' , 'ذكي' , 'اسمعك' , 'ممنوع' , 'مو ظلمه'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id_,msg.id_,'• اجابتك صحيحه ذكي وربي')     
redis:incrby(max..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(max.."GAME:S"..msg.chat_id_)
redis:del(max.."GAME:CHER"..msg.chat_id_)
return false  
end
end
end
end
if redis:get(max.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 20 then
sendMsg(msg.chat_id_,msg.id_,"*• عذراً لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 } *\n")
return false  end 
local GETNUM = redis:get(max.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(max..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
redis:del(max.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
redis:incrby(max..':User_Points:'..msg.chat_id_..data.id_,5)
sendMsg(msg.chat_id_,msg.id_,'*• مبروك فزت معنا وخمنت الرقم الصحيح\n• تم اضافة { 5 } من النقاط *\n')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:incrby(max..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(redis:get(max..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
redis:del(max..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
redis:del(max.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'\n*• لقد خسرت في اللعبه \n• حظاً اوفر في المره القادمه \n• كان الرقم الذي تم تخمينه { '..GETNUM..' }\n*')
else
sendMsg(msg.chat_id_,msg.id_,'\n*• تخمينك غلط \n• ارسل رقم تخمنه مره اخره \n*')
end
end
end
end

if msg.text then  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_}, function(arg,data) 
if redis:get(max.."chencher"..msg.sender_user_id_) then 
if redis:get(max.."chencher"..msg.sender_user_id_) ~= data.first_name_ then 
tahan = '['..(redis:get(max.."chencher"..msg.sender_user_id_) or '')..']'
taham = '['..data.first_name_..']'
sendMsg(msg.chat_id_,msg.id_,taha[math.random(#taha)])
end  
end
redis:set(max.."chencher"..msg.sender_user_id_, data.first_name_) 
end,nil) 
end
end
return {
max = {
"^(حزوره)$", 
"^(المختلف)$",
 "^(رياضيات)$",
  "^(انقليزي)$",
    "^(الانقليزي)$",
  "^(تفكيك)$",
   "^(الالغاز)$",
      "^(لغز)$",
      "^(امثله)$",
"^(نعم)$",
"^(الاعبين)$",
"^(بدء الاسئله)$",
"^(ختيارات)$",
"^(اسئله)$",
"^(الالعاب)$",
"^(محيبس)$",
"^(تخمين)$",
"^(خمن)$",
"^(بات)$",
'^(تعطيل) (.+)$',
'^(تفعيل) (.+)$',
"^(اسرع)$",
"^(الاسرع)$",
"^(نقاطي)$",
"^(ترتيب)$",
"^(معاني)$",
"^(عكس)$",
"^(العكس)$", 
"^(العكسس)$", 
"^(بيع نقاطي) (%d+)$",
"^(اضف رسائل) (%d+)$",
"^(اضف نقاط) (%d+)$",
"^(روليت)$",
"^(رياضيات)$",
"^(الرياضيات)$",
"^(انكليزي)$",
"^(الانكليزي)$",
"^(قائمه الالعاب)$",
 },
 imax = games,
 dmax = procces,
 }
