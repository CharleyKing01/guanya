<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>冠亚集团</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/static/front/css/public.css" />
    <script type="text/javascript" src="/static/front/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/static/front/js/public.js"></script>
    <script src="/static/front/js/uaredirect.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <script type="text/javascript">
        $(function () {
            document.getElementById('searchbox').onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) { // enter 键
                    if (myvalidform()) {
                        window.location.href = "search.aspx?key=" + $("#searchbox").val() + "";
                    } else {
                        $('.btn-search').addClass('on');
                    }
                }
            };

        });
        function show() {
            alert("a");
            $(".tabs a").first().removeClass("on");
            $(".tabs a").last().addClass("on");
            $(".conts .item item-3").show().siblings().hide();
        }

        function myvalidform() {
            if ($("#searchbox").val() == "") {
                $.Showmsg("请输入关键字！");
                setTimeout(closeMsg, 1200);
                return false;
            }
            if ($("#searchbox").val().length > 8) {
                $.Showmsg("关键字不得超过8个字符!");
                setTimeout(closeMsg, 1200);
                return false;
            }
            return true;
        }
        function closeMsg() {
            $.Hidemsg()
        }

        var allcookies = document.cookie;
        function getCookie(cookie_name) {
            var value = "";
            var allcookies = document.cookie;
            var cookie_pos = allcookies.indexOf(cookie_name);   //索引的长度
            // 如果找到了索引，就代表cookie存在，
            // 反之，就说明不存在。
            if (cookie_pos != -1) {
                // 把cookie_pos放在值的开始，只要给值加1即可。
                cookie_pos += cookie_name.length + 1;      //这里我自己试过，容易出问题，所以请大家参考的时候自己好好研究一下。。。
                var cookie_end = allcookies.indexOf(";", cookie_pos);
                if (cookie_end == -1) {
                    cookie_end = allcookies.length;
                }
                value = unescape(allcookies.substring(cookie_pos, cookie_end)); //这里就可以得到你想要的cookie的值了。。。
            }
            return value;
        }
    </script>

    <link rel="stylesheet" href="/static/front/css/index.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/static/front/css/lte-ie8-index.css" />
    <![endif]-->
    <link rel="stylesheet" href="/static/front/css/font-dincond.css" />

    <script type="text/javascript" src="/static/front/js/index.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#subjects .g-wrap .item-1 .p2").css("left", "350px");
            $("#subjects .g-wrap .item-1 .p2").css("top", "21px");
        })
    </script>

</head>
<body>
<div id="header">
    <div class="g-wrap">
        <a id="logo" href="index.aspx"><img src="/static/front/images/logo.png" height="48px"></a>
        <ul id="nav">
            <li class="n1"><a href="index.aspx"><span>首页</span><span class="bkg"></span></a></li>
            <li class="n2 more"><a href="about.aspx"><span>走进冠亚</span><span class="bkg"></span></a></li>
            <li class="n3 more"><a href="news.aspx"><span>新闻中心</span></span><span class="bkg"></span></a></li>
            <li class="n4 "><a href="investors.aspx"><span>企业文化</span><span class="bkg"></span></a></li>
            <li class="n5 "><a href="javascript:;"><span>项目展示</span><span class="bkg"></span></a></li>
            <li class="n6 more"><a href="citizenship.aspx"><span>招聘频道</span><span class="bkg"></span></a></li>

        </ul>

    </div>
</div>

<div id="content">

    <div id="subNav">
        <div class="g-wrap">
            <div class="item about">
                <a href="about.aspx?type=3">董事长致辞<span></a><a href="about.aspx?type=5">公司荣誉<span></a><a href="about.aspx?type=6">成员企业<span></a><a href="about.aspx?type=6">大事纪要<span></a>
            </div>
            <div class="item news">
                <a href="news.aspx?type=8">新闻内容<span></a>
            </div>

            <div class="item citizenship">
                <a href="citizenship.aspx?type=18">招聘公司<span></a>
                <a href="citizenship.aspx?type=18">招聘岗位<span></a>
                <a href="citizenship.aspx?type=18">简历<span></a>
            </div>
            <div class="item search">
                <input id='searchbox' type="text" placeholder="请输入关键词" />
            </div>
            <div id="language-box" class="item langs">
                <a id="on" href="../">中文简体</a>
                <a href="/big5">中文繁体</a>
                <a href="/en">EN</a>
            </div>
            <div class="item nwmenu">
                <div class="nwmenu-inner">
                    <div class="nwi-box clearfix">    <ul class="nwmenu-list">        <li><a href="http://life.vanke.com/" target="_blank">万科在线家</a></li>        <li><a href="https://www.vankeservice.com/" target="_blank">万科物业</a></li>        <li><a href="http://www.scpgroup.com/" target="_blank">印力集团</a></li>        <li><a href="http://www.lakesonghua.com/" target="_blank">万科松花湖度假区</a></li>        <li><a href="http://www.inboyu.com/" target="_blank">泊寓</a></li>        <li><a href="http://www.vanlian.cn/" target="_blank">北京万科链家装饰</a></li>        <li><a href="http&#58;&#47;&#47;vma.vanke.com" target="_blank">深圳万科梅沙书院</a></li>        <li><a href="http&#58;&#47;&#47;www.vkbs.cn&#47;en&#47;" target="_blank">上海万科双语学校</a></li>        <li><a href="http&#58;&#47;&#47;www.naradalz.com&#47;" target="_blank">杭州良渚君澜度假酒店</a></li>        <li><a href="http&#58;&#47;&#47;pdc.vanke.com&#47;" target="_blank">万科招标采购</a></li>        <li><a href="http://www.gzvankecare.com" target="_blank">万颐养老在华南</a></li>        <li><a href="http://www.gzvankehotel.com" target="_blank">花园里的鱼度假村</a></li>    </ul></div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            var arr = new Array("zh-CN", "zh-Hant", 'en');
            $("#language-box a").each(function (index) {
                $(this).click(function () {
                    setCookieLanguage('Language', arr[index]);
                });
            });
        })
        function setCookieLanguage(name, value) {
            var argv = setCookieLanguage.arguments;
            var argc = setCookieLanguage.arguments.length;
            var expires = (argc > 2) ? argv[2] : null;
            if (expires != null) {
                var LargeExpDate = new Date();
                LargeExpDate.setTime(LargeExpDate.getTime() + (expires * 1000 * 3600 * 24));
            }
            document.cookie = name + "=" + escape(value) + ((expires == null) ? "" : ("; expires=" + LargeExpDate.toGMTString())) + ("; path=/") + ("; domain=.vanke.com");
        }
    </script>


    <div id="banner">
        <ul class="pics">
        <#list topImageList as image>
            <li class="b1" style="background-image" ><img src="${image.url}"/><a target="_blank" href="#"></a></li>
        </#list>
        </ul>
        <div class="btns">
            <a class="prev" href="javascript:void(0);"><span class="off"></span><span class="on"></span></a>
            <a class="next" href="javascript:void(0);"><span class="off"></span><span class="on"></span></a>
        </div>
        <div class="g-wrap">
            <ul class="idxs">
                <#list topImageList as image>
                    <li></li>
                </#list>
            </ul>
        </div>
    </div>

    <!-- 新闻滚动  新版本  8-18(hyq) start -->

    <div class="redian">
        <div class="r-wrap">

            <div class="caifu">
                <a href="#">
                    <h1>${specialNews.title}</h1>
                    <p class="focus-content">
                        ${specialNews.content}
                    </p>
                </a>
            </div>
            <div class="news-1">
                <ul class="tab-nav tab1">
                    <#list typeList as type>
                        <li>${type.name}</li>
                    </#list>
                </ul>
                <div class="xian"></div>

                <#list typeList as type>
                    <#if type_index == 0>
                        <div class="tab-box" style="display: block">
                    <#else>
                        <div class="tab-box" style="display: none">
                    </#if>
                        <#list newsList as news>
                            <#if type.name == news.typeName>
                                <a href="#">
                                    <p><i>${news.createTimeStr}</i>${news.title}</p>
                                </a>
                            </#if>
                        </#list>
                    </div>

                </#list>


            </div>
            <div class="stock"></div>
        </div>
    </div>

    <script>
        //新闻选项卡
        $(document).ready(function () {
            function tab(i) {
                $(i).children().click(function () {  //触发方式//click//mouseover
                    $(this).siblings().removeClass();
                    $(this).addClass('hover');
                    $(this).parent().siblings('.tab-box').hide();
                    $(this).parent().siblings('.tab-box').eq($(this).index()).show();
                    if ($(this).index() == 0)
                    { $('.xian').animate({ left: '0px' }); }
                    else if ($(this).index() == 1) {
                        { $('.xian').animate({ left: '80px' }); }
                    }
                    else if ($(this).index() == 2) {
                        { $('.xian').animate({ left: '160px' }); }
                    }
                    else if ($(this).index() == 3) {
                        { $('.xian').animate({ left: '240px' }); }
                    }
                })
            }

            //tab调用
            $(function () {
                tab('.tab1')
                tab('.tab2')
            })

            $(function () {
                $(".nav").click(function () {
                    $(this).toggleClass("color").siblings().removeClass("color")//颜色
                    $(this).next().slideToggle(500).siblings("ul").slideUp(500);
                })
            })
        });
    </script>


    <!-- 新闻滚动  新版本  8-18(hyq) end -->
    <div id="subjects">
        <div class="g-wrap ready trans">
            <a class="item-1" target="_blank" href="">
					<span class="p1">
						<img src="${bottomImage1.url}" alt="" />
					</span>
                <span class="p2"></span>
            </a>
            <a class="item-2" target="_blank" href="">
					<span class="p1">
						<img src="${bottomImage2.url}" alt="" />
					</span>
                    <span class="p2">
						<img src="${bottomImage3.url}" alt="" />
					</span>
            </a>
            <a class="item-3" target="_blank" href="">
					<span class="p1">
						<img src="${bottomImage4.url}" alt="" />
					</span>
                <span class="p2">
						<img src="${bottomImage5.url}" alt="" />
					</span>
            </a>
            <a class="item-4" target="_blank" href="">
					<span class="p1">
						<img src="${bottomImage6.url}" alt="" />
					</span>
                <span class="p2">
                    <img src="${bottomImage7.url}" alt="" />
                </span>
            </a>
        </div>
    </div>
</div>


<div id="footer">
    <div id="reference">
        <div class="g-wrap">
            <div class="left">
                <p>您来访的目的是了解：</p>
                <a class="a1" href="about.aspx?type=24">冠亚集团</a>

                <a class="a2" href="https://www.vankeservice.com/" target="_blank">冠亚集团 </a>
                <a class="a3" href="http://life.vanke.com/" target="_blank">冠亚集团</a>
                <a style="background-image: url(/static/front/images/refer_icon_3y.png);" href="http://www.scpgroup.com/" target="_blank">冠亚集团</a>
            </div>
            <div class="right">
                <a target="_blank" href="http://5198.vanke.com/">廉政举报</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a target="_blank" href="wjcx/default.aspx">违纪查询</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="contact.aspx">联络冠亚</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="about.aspx?type=4">关注冠亚</a>
            </div>
        </div>
    </div>

</div>
<div style="display: none">
    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cspan id='cnzz_stat_icon_1254929906'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D1254929906' type='text/javascript'%3E%3C/script%3E"));</script>
</div>
</body>
</html>
