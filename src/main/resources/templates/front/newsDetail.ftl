<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>冠亚集团</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/static/front/css/public.css" />
    <link rel="stylesheet" href="/static/front/css/newsList.css" />
    <link rel="stylesheet" href="/static/front/css/newsDetail.css" />
    <script type="text/javascript" src="/static/front/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/static/front/js/public.js"></script>
    <script src="/static/front/js/uaredirect.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=8" />

    <![endif]-->
    <link rel="stylesheet" href="/static/front/css/font-dincond.css" />

    <script type="text/javascript">
        $(function () {
            $("#subjects .g-wrap .item-1 .p2").css("left", "350px");
            $("#subjects .g-wrap .item-1 .p2").css("top", "21px");
        })
    </script>
    <style type="text/css">
        .newscontent {
            margin-top: 40px;
            padding-left: 95px;
            position: relative;
            width: 705px;
        }
        .newscontent .date {
            background: url(/static/front/images/datebg.png) no-repeat scroll 0 0;
            height: 73px;
            left: 0;
            position: absolute;
            top: 0;
            width: 75px;
            text-align: center;
        }
        .newscontent .date div {
            color: #fff;
            font-size: 36px;
            text-align: center;
            margin-top: 5px;
        }
        .newscontent .date span {
            color: #1C48A4;
            font-size: 13px;
            line-height: 33px;
        }
        .newscontent .newstitle {
            color: #1c48a4;
            font-size: 14px;
            margin-bottom: 5px;
            width: 500px;
        }
        .textcontent {
            color: #8a8b8d;
            height: 43px;
            line-height: 20px;
            margin-top: 30px;
        }
    </style>

</head>
<body>
<div id="header">
    <div class="g-wrap">
        <img src="/static/front/images/logo.png" height="48px">
        <ul id="nav">
            <li class="n1"><a href="/front/index.do"><span>首页</span><span class="bkg"></span></a></li>
            <li class="n2 more"><a href="/front/into.do" target="_blank"><span>走进冠亚</span><span class="bkg"></span></a></li>
            <li class="n3 more"><a href="/front/newsList.do" target="_blank"><span>新闻中心</span></span><span class="bkg"></span></a></li>
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
                <a href="/front/into.do" target="_blank">董事长致辞<span></a>
                <a href="/front/into.do" target="_blank">公司荣誉<span></a>
                <a href="/front/into.do" target="_blank">成员企业<span></a>
                <a href="/front/into.do" target="_blank">大事纪要<span></a>
            </div>
            <div class="item news">
                <#list typeList as type>
                    <a href="/front/newsList.do?id=${type.id}" target="_blank">${type.name}<span></a>
                </#list>
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



<#--新闻列表页-->
    <div class="main-content">
        <div id="ContentPlaceHolder1_Panel1">
            <div class="main-left">
                <div class="newscontent">
                    <div class="date">
                        <div>${news.createTimeShort2}</div>
                        <span>${news.createTimeShort1}</span>
                    </div>
                    <div class="newstitle">${news.title}</div>
                    <div class="textcontent">
                        ${news.content}
                    </div>
                </div>
            </div>
            <div class="main-right">
                <ul>
                    <#list typeList as type>
                        <#if type.id == news.type>
                            <li id="tags1" class="selected"><a href="/front/newsList.do?id=${type.id}" style="left: 0px;">${type.name}</a></li>
                        <#else >
                            <li id="tags2" class=""><a href="/front/newsList.do?id=${type.id}" style="left: 0px;">${type.name}</a></li>
                        </#if>
                    </#list>

                </ul>
            </div>
        </div>
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

</body>
</html>
