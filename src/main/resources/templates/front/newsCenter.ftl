<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>冠亚集团</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="/static/front/css/public.css" />
    <link rel="stylesheet" href="/static/front/css/newsCenter.css" />
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

</head>
<body>
<div id="header">
    <div class="g-wrap">
        <img src="/static/front/images/logo.png" height="48px">
        <ul id="nav">
            <li class="n1"><a href="/front/index.do"><span>首页</span><span class="bkg"></span></a></li>
            <li class="n2 more"><a href="/front/into.do" target="_blank"><span>走进冠亚</span><span class="bkg"></span></a></li>
            <li class="n3 more"><a href="/front/newsCenter.do" target="_blank"><span>新闻中心</span></span><span class="bkg"></span></a></li>
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

    <#--新闻中心页-->
    <div class="main-content">

        <div id="ContentPlaceHolder1_home">
            <div class="Comprehensive">
                <div class="titlepic">
                    <img src="/static/front/images/z-title.png">
                </div>
                <div class="menu_l animated delay0d1s fadeInRight">
                    <ul>
                        <#list typeList as type>
                            <li><a href="/front/newsList.do?id=${type.id}" target="_blank">${type.name}</a></li>
                        </#list>
                    </ul>
                </div>
                <div class="com_con">
                    <div class="left animated delay0d1s fadeIn">
                        <div class="first_n"><div class="date">20171023</div><div class="title"><a href="news.aspx?tags=1&amp;newsid=21388">央企首单！保利租赁住房REITs成功获批，住房租赁...</a></div><div class="desc">2017年10月23日，国内首单央企租赁住房REITs、首单储架发行REITs——中联前海开源-保利地产租赁住房一号资产支持专项计划（下称“保利租赁住房REITs”）获得上海证券交易所审...</div></div><ul>  <li><a href="news.aspx?tags=1&amp;newsid=21179">展位售罄 | CR Expo 2017观众预...<span>2017.05.05</span></a></li>  <li><a href="news.aspx?tags=1&amp;newsid=21163">喜讯│保利地产获第八届天马奖“投资者关系最佳...<span>2017.05.03</span></a></li>  <li><a href="news.aspx?tags=1&amp;newsid=21162">喜讯│保利地产获全景网“全景投资者关系金奖”<span>2017.05.03</span></a></li>  <li><a href="news.aspx?tags=1&amp;newsid=21154">新高度 新飞跃 新启程 ——第35届锦汉家居...<span>2017.04.25</span></a></li>  <li><a href="news.aspx?tags=1&amp;newsid=21110">送孩子一双翅膀，与保利和乐教育一起两翼启航—...<span>2017.02.22</span></a></li></ul>
                    </div>
                    <div class="center  animated delay0d3s fadeIn">
                        <div class="part1 public_mian">
                            <div class="public_play" style="opacity: 0.8; display: none;">
                                <a href="news.aspx?tags=2">
                                    <img src="/static/front/images/s.png" style="opacity: 1; display: none;"></a>
                            </div>
                            <a href="news.aspx?tags=2">
                                <img src="/static/front/images/pic2.png"></a>
                        </div>
                        <div class="part2">
                            <div class="first_n"><div class="date">20160621</div><div class="title"><a href="news.aspx?tags=2&amp;newsid=20923">保利地产首席市场分析师吴定金受邀为兰州房...</a></div><div class="desc">为深刻认识全国房地产发展形势、掌握兰州市房地产发展...</div></div><ul>  <li><span>2015.12.16</span><a href="news.aspx?tags=2&amp;newsid=20798">多元创新，大连国际会议中心获“中国十佳会...</a></li>  <li><span>2015.12.04</span><a href="news.aspx?tags=2&amp;newsid=20796">集团公司总经理张振高一行赴郑州公司视察工...</a></li></ul>
                        </div>
                    </div>
                    <div class="right  animated delay0d5s fadeIn">
                        <div class="pic1 public_mian">
                            <div class="public_play">
                                <a href="#" target="_blank">
                                    <img src="/static/front/images/s.png"></a>
                            </div>
                            <a href="#" target="_blank">
                                <img src="/static/front/images/pic3.png"></a>
                        </div>
                        <div class="pic1 public_mian">
                            <div class="public_play">
                                <a href="#" target="_blank">
                                    <img src="/static/front/images/s.png"></a>
                            </div>
                            <a href="#" target="_blank">
                                <img src="/static/front/images/pic4.png"></a>
                        </div>
                        <div class="pic2 public_mian">
                            <div class="public_play" style="display: none;">
                                <a href="#" target="_blank">
                                    <img src="/static/front/images/s.png" style="opacity: 1; display: none;"></a>
                            </div>
                            <a href="#" target="_blank">
                                <img src="/static/front/images/pic3.png"></a>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                $(".public_mian").mouseenter(function (e) {
                    $(this).find(".public_play").fadeIn(400);
                    $(this).find(".public_play img").delay(400).fadeIn(800);
                });
                $(".public_mian").mouseleave(function (e) {
                    $(this).find(".public_play").stop(true, false).fadeOut(200);
                    $(this).find(".public_play img").stop(true, false).fadeOut(200);
                });
            </script>
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
