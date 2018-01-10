<!doctype html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>走进冠亚</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/static/front/css/public.css" />
    <script type="text/javascript" src="/static/front/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/static/front/js/public.js"></script>
    <script src="/static/front/js/uaredirect.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=8" />

    <script type="text/javascript">
        $(function () {
            $("#subjects .g-wrap .item-1 .p2").css("left", "350px");
            $("#subjects .g-wrap .item-1 .p2").css("top", "21px");
        })
    </script>


    <style type="text/css">

        ul, li {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        #wrapper {
            min-height: 720px;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            background-color: #fff;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-box-pack: left;
            -webkit-justify-content: left;
            -ms-flex-pack: left;
            justify-content: left;
            overflow: hidden;
            padding-top: 50px;
            border-top: #C3D4DB  3px solid;
            width: 100%;
        }

        #left-side {
            height: 70%;
            width: 25%;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center;
        }
        #left-side ul li {
            padding-top: 10px;
            padding-bottom: 10px;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            line-height: 34px;
            color: rgba(51, 51, 51, 0.5);
            font-weight: 500;
            cursor: pointer;
            -webkit-transition: all .2s ease-out;
            transition: all .2s ease-out;
            font-size: 30px;
        }
        #left-side ul li:hover {
            color: #333333;
            -webkit-transition: all .2s ease-out;
            transition: all .2s ease-out;
        }
        #left-side ul li:hover > .icon {
            fill: #333;
        }
        #left-side ul li.active {
            color: #333333;
        }
        #left-side ul li.active:hover > .icon {
            fill: #E74C3C;
        }

        #border {
            height: 288px;
            width: 1px;
            background-color: rgba(51, 51, 51, 0.2);
        }
        #border #line.one {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 10px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }
        #border #line.two {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 69px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }
        #border #line.three {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 123px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }
        #border #line.four {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 177px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #border #line.five {
            width: 5px;
            height: 54px;
            background-color: #E74C3C;
            margin-left: -2px;
            margin-top: 231px;
            -webkit-transition: all .4s ease-in-out;
            transition: all .4s ease-in-out;
        }

        #right-side {
            height: 300px;
            width: 75%;
            overflow: hidden;
        }
        #right-side #first, #right-side #second, #right-side #third, #right-side #fourth,#right-side #five {
            position: absolute;
            height: 300px;
            width: 75%;
            -webkit-transition: all .6s ease-in-out;
            transition: all .6s ease-in-out;
            margin-top: -350px;
            opacity: 0;
            display: -webkit-box;
            display: -webkit-flex;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -webkit-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
        }
        #right-side #first h1, #right-side #second h1, #right-side #third h1, #right-side #fourth h1,#right-side #five h1 {
            font-weight: 800;
            color: #333;
        }
        #right-side #first p, #right-side #second p, #right-side #third p, #right-side #fourth p, #right-side #five p {
            color: #333;
            font-weight: 500;
            padding-left: 30px;
            padding-right: 30px;
        }
        #right-side #first.active, #right-side #second.active, #right-side #third.active, #right-side #fourth.active, #right-side #five.active {
            margin-top: 0px;
            opacity: 1;
            -webkit-transition: all .6s ease-in-out;
            transition: all .6s ease-in-out;
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

<div id="wrapper">

    <div id="left-side">
        <ul>
            <li class="choose active" onclick="menuClick('choose')">
                集团概况
            </li>
            <li class="pay" onclick="menuClick('pay')">
                董事长致辞
            </li>
            <li class="wrap" onclick="menuClick('wrap')">
                公司荣誉
            </li>
            <li class="ship" onclick="menuClick('ship')">
                成员企业
            </li>
            <li class="bigthing" onclick="menuClick('bigthing')">
                大事纪要
            </li>
        </ul>
    </div>

    <div id="border">
        <div id="line" class="one"></div>
    </div>

    <div id="right-side">
        <div id="first" class="active">
            集团概况
        </div>
        <div id="second">
            董事长致辞
        </div>
        <div id="third">
            公司荣誉
        </div>
        <div id="fourth">
            成员企业
        </div>
        <div id="five">
            大事纪要
        </div>
    </div>
</div>

<script>
    function menuClick(val){
        if(val == 'choose') {
            $('.choose').addClass('active');
            $('.pay').removeClass('active');
            $('.wrap').removeClass('active');
            $('.ship').removeClass('active');
            $('.bigthing').removeClass('active');
            $('#line').removeClass('five');
            $('#line').addClass('one');
            $('#line').removeClass('two');
            $('#line').removeClass('three');
            $('#line').removeClass('four');
            $('#first').addClass('active');
            $('#second').removeClass('active');
            $('#third').removeClass('active');
            $('#fourth').removeClass('active');
            $('#five').removeClass('active');
        }else if(val == 'pay') {
            $('.pay').addClass('active');
            $('.choose').removeClass('active');
            $('.wrap').removeClass('active');
            $('.ship').removeClass('active');
            $('.bigthing').removeClass('active');
            $('#line').removeClass('five');
            $('#line').addClass('two');
            $('#line').removeClass('one');
            $('#line').removeClass('three');
            $('#line').removeClass('four');
            $('#first').removeClass('active');
            $('#second').addClass('active');
            $('#third').removeClass('active');
            $('#fourth').removeClass('active');
            $('#five').removeClass('active');
        }else if(val == 'wrap') {
            $('.wrap').addClass('active');
            $('.pay').removeClass('active');
            $('.choose').removeClass('active');
            $('.ship').removeClass('active');
            $('.bigthing').removeClass('active');
            $('#line').removeClass('five');
            $('#line').addClass('three');
            $('#line').removeClass('two');
            $('#line').removeClass('one');
            $('#line').removeClass('four');
            $('#first').removeClass('active');
            $('#second').removeClass('active');
            $('#third').addClass('active');
            $('#fourth').removeClass('active');
            $('#five').removeClass('active');
        }else if(val == 'ship') {
            $('.ship').addClass('active');
            $('.pay').removeClass('active');
            $('.wrap').removeClass('active');
            $('.choose').removeClass('active');
            $('.bigthing').removeClass('active');
            $('#line').removeClass('five');
            $('#line').addClass('four');
            $('#line').removeClass('two');
            $('#line').removeClass('three');
            $('#line').removeClass('one');
            $('#first').removeClass('active');
            $('#second').removeClass('active');
            $('#third').removeClass('active');
            $('#fourth').addClass('active');
            $('#five').removeClass('active');
        }else if(val == 'bigthing') {
            $('.ship').removeClass('active');
            $('.pay').removeClass('active');
            $('.wrap').removeClass('active');
            $('.choose').removeClass('active');
            $('.bigthing').addClass('active');
            $('#line').addClass('five');
            $('#line').removeClass('four');
            $('#line').removeClass('two');
            $('#line').removeClass('three');
            $('#line').removeClass('one');
            $('#first').removeClass('active');
            $('#second').removeClass('active');
            $('#third').removeClass('active');
            $('#fourth').removeClass('active');
            $('#five').addClass('active');
        }

    }


</script>

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
