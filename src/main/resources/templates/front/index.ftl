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
        <img src="/static/front/images/logo.png" height="48px">
        <ul id="nav">
            <li class="n1"><a href="#"><span>首页</span><span class="bkg"></span></a></li>
            <li class="n2 more"><a href="#"><span>走进冠亚</span><span class="bkg"></span></a></li>
            <li class="n3 more"><a href="#"><span>新闻中心</span></span><span class="bkg"></span></a></li>
            <li class="n4 "><a href="#"><span>企业文化</span><span class="bkg"></span></a></li>
            <li class="n5 "><a href="#"><span>项目展示</span><span class="bkg"></span></a></li>
            <li class="n6 more"><a href="#"><span>招聘频道</span><span class="bkg"></span></a></li>

        </ul>

    </div>
</div>

<div id="content">
    <div id="subNav">
        <div class="g-wrap">
            <div class="item about">
                <a href="#">董事长致辞<span></a>
                <a href="#">公司荣誉<span></a>
                <a href="#">成员企业<span></a>
                <a href="#">大事纪要<span></a>
            </div>
            <div class="item news">
                <a href="#">新闻内容<span></a>
            </div>
            <div class="item citizenship">
                <a href="#">招聘公司<span></a>
                <a href="#">招聘岗位<span></a>
                <a href="#">简历<span></a>
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
    </div>

    <!-- 新闻三张图片 -->
    <div class="div-three-pics">
        <#list bottomImageList as bottomImage>
            <img class="div-three-pic-${bottomImage_index+1}" src="${bottomImage.url}"/>
        </#list>
    </div>

    <div class="contact-information">
        <div class="main-list">
            <div class="main-list-con">
                <h3>产品与服务</h3>
                <h4>PRODUCTS<br>&amp;SERVICES</h4>
            </div>
            <ul>
                <li class="main-list1 animated zoomIn"> <a href="#"><p>地产</p></a> </li>
                <li class="main-list2 animated zoomIn"> <a href="#"><p>物业</p></a> </li>
                <li class="main-list3 animated zoomIn"> <a href="#x.html"><p>酒店</p></a> </li>
                <li class="main-list4 animated zoomIn"> <a href="#"><p>客户中心</p></a> </li>
                <li class="main-list5 animated zoomIn"> <a href="#"><p>其他</p></a> </li>
            </ul>
        </div>
        <div class="bottom_right">
            <dl>
                <dt>
                    <img src="/static/front/images/t_code.jpg">关注冠亚集团微信<br>
                    ( SCE1966hk )</dt>
                <dd class="t1">852-24899798</dd>
                <dd class="t2">地址： 香港新界葵涌葵昌路88号11楼<br>
                    &nbsp;
                </dd>
                <dd class="t3">
                </dd>
            </dl>
        </div>
    </div>

    <div id="footer">
        <a href="websitemap.aspx" target="_blank">站点地图</a><img src="/static/front/images/footerline.gif" alt="">
        <a href="#" onclick="openwin()">法律声明</a><img src="/static/front/images/footerline.gif" alt="">
        <a href="" target="_blank">联系我们</a><br>
        <div>
            <span style="vertical-align:bottom; height:47px; margin-left:15px">
                <span style="vertical-align:bottom; height:47px; margin-left:15px">闽ICP备05017039号</span>
                <a style="vertical-align: bottom;" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31011502002638" target="_blank">
                    <img style="vertical-align: bottom;" src="/static/front/images/gongan.png">闽ICP备05017039号
                </a>
                <a href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20130530163953715">
                    <img src="/static/front/images/icon.gif" border="0">
                </a>
            </span>
        </div>
        冠亚集团版权所有copyright © 2018<br>
    </div>


<div style="display: none">
    <script type="text/javascript">
        var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
        document.write(unescape("%3Cspan id='cnzz_stat_icon_1254929906'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D1254929906' type='text/javascript'%3E%3C/script%3E"));
    </script>
</div>
</body>
</html>
