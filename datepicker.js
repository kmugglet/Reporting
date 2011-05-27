
    

  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <title>public/javascripts/datepicker.js at master from kplatfoot's Calendar-DatePicker-for-Rails - GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />

    <link href="https://assets1.github.com/stylesheets/bundle_common.css?6594fe00e582252f3519fda74da9cb2e5b7dadf7" media="screen" rel="stylesheet" type="text/css" />
<link href="https://assets1.github.com/stylesheets/bundle_github.css?6594fe00e582252f3519fda74da9cb2e5b7dadf7" media="screen" rel="stylesheet" type="text/css" />

    <script type="text/javascript" charset="utf-8">
      var GitHub = {}
      var github_user = null
      
    </script>
    <script src="https://assets3.github.com/javascripts/jquery/jquery-1.4.2.min.js?6594fe00e582252f3519fda74da9cb2e5b7dadf7" type="text/javascript"></script>
    <script src="https://assets3.github.com/javascripts/bundle_common.js?6594fe00e582252f3519fda74da9cb2e5b7dadf7" type="text/javascript"></script>
<script src="https://assets0.github.com/javascripts/bundle_github.js?6594fe00e582252f3519fda74da9cb2e5b7dadf7" type="text/javascript"></script>

        <script type="text/javascript" charset="utf-8">
      GitHub.spy({
        repo: "kplatfoot/Calendar-DatePicker-for-Rails"
      })
    </script>

    
  
    
  

  <link href="https://github.com/kplatfoot/Calendar-DatePicker-for-Rails/commits/master.atom" rel="alternate" title="Recent Commits to Calendar-DatePicker-for-Rails:master" type="application/atom+xml" />

        <meta name="description" content="A simple JavaScript date picker with Rails helpers." />
    <script type="text/javascript">
      GitHub.nameWithOwner = GitHub.nameWithOwner || "kplatfoot/Calendar-DatePicker-for-Rails";
      GitHub.currentRef = 'master';
    </script>
  

            <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-3769691-2']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script');
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        ga.setAttribute('async', 'true');
        document.documentElement.firstChild.appendChild(ga);
      })();
    </script>

  </head>

  

  <body class="logged_out ">
    

    
      <script type="text/javascript">
        var _kmq = _kmq || [];
        function _kms(u){
          var s = document.createElement('script'); var f = document.getElementsByTagName('script')[0]; s.type = 'text/javascript'; s.async = true;
          s.src = u; f.parentNode.insertBefore(s, f);
        }
        _kms('//i.kissmetrics.com/i.js');_kms('//doug1izaerwt3.cloudfront.net/406e8bf3a2b8846ead55afb3cfaf6664523e3a54.1.js');
      </script>
    

    

    

    

    <div class="subnavd" id="main">
      <div id="header" class="true">
        
          <a class="logo boring" href="https://github.com">
            <img src="/images/modules/header/logov3.png?changed" class="default" alt="github" />
            <![if !IE]>
            <img src="/images/modules/header/logov3-hover.png" class="hover" alt="github" />
            <![endif]>
          </a>
        
        
        <div class="topsearch">
  
    <ul class="nav logged_out">
      <li><a href="https://github.com">Home</a></li>
      <li class="pricing"><a href="/plans">Pricing and Signup</a></li>
      <li><a href="https://github.com/training">Training</a></li>
      <li><a href="https://gist.github.com">Gist</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="https://github.com/login">Login</a></li>
    </ul>
  
</div>

      </div>

      
      
        
    <div class="site">
      <div class="pagehead repohead vis-public   ">

      

      <div class="title-actions-bar">
        <h1>
          <a href="/kplatfoot">kplatfoot</a> / <strong><a href="https://github.com/kplatfoot/Calendar-DatePicker-for-Rails">Calendar-DatePicker-for-Rails</a></strong>
          
          
        </h1>

        
    <ul class="actions">
      

      
        <li class="for-owner" style="display:none"><a href="https://github.com/kplatfoot/Calendar-DatePicker-for-Rails/admin" class="minibutton btn-admin "><span><span class="icon"></span>Admin</span></a></li>
        <li>
          <a href="/kplatfoot/Calendar-DatePicker-for-Rails/toggle_watch" class="minibutton btn-watch " id="watch_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '36fa6f38126267fef73488468a12137cc2f74287'); f.appendChild(s);f.submit();return false;" style="display:none"><span><span class="icon"></span>Watch</span></a>
          <a href="/kplatfoot/Calendar-DatePicker-for-Rails/toggle_watch" class="minibutton btn-watch " id="unwatch_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '36fa6f38126267fef73488468a12137cc2f74287'); f.appendChild(s);f.submit();return false;" style="display:none"><span><span class="icon"></span>Unwatch</span></a>
        </li>
        
          
            <li class="for-notforked" style="display:none"><a href="/kplatfoot/Calendar-DatePicker-for-Rails/fork" class="minibutton btn-fork " id="fork_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '36fa6f38126267fef73488468a12137cc2f74287'); f.appendChild(s);f.submit();return false;"><span><span class="icon"></span>Fork</span></a></li>
            <li class="for-hasfork" style="display:none"><a href="#" class="minibutton btn-fork " id="your_fork_button"><span><span class="icon"></span>Your Fork</span></a></li>
          

          
        
      
      
      <li class="repostats">
        <ul class="repo-stats">
          <li class="watchers"><a href="/kplatfoot/Calendar-DatePicker-for-Rails/watchers" title="Watchers" class="tooltipped downwards">4</a></li>
          <li class="forks"><a href="/kplatfoot/Calendar-DatePicker-for-Rails/network" title="Forks" class="tooltipped downwards">1</a></li>
        </ul>
      </li>
    </ul>

      </div>

        
  <ul class="tabs">
    <li><a href="https://github.com/kplatfoot/Calendar-DatePicker-for-Rails/tree/master" class="selected" highlight="repo_source">Source</a></li>
    <li><a href="https://github.com/kplatfoot/Calendar-DatePicker-for-Rails/commits/master" highlight="repo_commits">Commits</a></li>
    <li><a href="/kplatfoot/Calendar-DatePicker-for-Rails/network" highlight="repo_network">Network</a></li>
    <li><a href="/kplatfoot/Calendar-DatePicker-for-Rails/pulls" highlight="repo_pulls">Pull Requests (0)</a></li>

    

    
      
      <li><a href="/kplatfoot/Calendar-DatePicker-for-Rails/issues" highlight="issues">Issues (0)</a></li>
    

            
    <li><a href="/kplatfoot/Calendar-DatePicker-for-Rails/graphs" highlight="repo_graphs">Graphs</a></li>

    <li class="contextswitch nochoices">
      <span class="toggle leftwards" >
        <em>Branch:</em>
        <code>master</code>
      </span>
    </li>
  </ul>

  <div style="display:none" id="pl-description"><p><em class="placeholder">click here to add a description</em></p></div>
  <div style="display:none" id="pl-homepage"><p><em class="placeholder">click here to add a homepage</em></p></div>

  <div class="subnav-bar">
  
  <ul>
    <li>
      <a href="#" class="dropdown">Switch Branches (1)</a>
      <ul>
        
          
            <li><strong>master &#x2713;</strong></li>
            
      </ul>
    </li>
    <li>
      <a href="#" class="dropdown defunct">Switch Tags (0)</a>
      
    </li>
    <li>
    
    <a href="/kplatfoot/Calendar-DatePicker-for-Rails/branches" class="manage">Branch List</a>
    
    </li>
  </ul>
</div>

  
  
  
  
  
  



        
    <div id="repo_details" class="metabox clearfix">
      <div id="repo_details_loader" class="metabox-loader" style="display:none">Sending Request&hellip;</div>

        <a href="/kplatfoot/Calendar-DatePicker-for-Rails/downloads" class="download-source" id="download_button" title="Download source, tagged packages and binaries."><span class="icon"></span>Downloads</a>

      <div id="repository_desc_wrapper">
      <div id="repository_description" rel="repository_description_edit">
        
          <p>A simple JavaScript date picker with Rails helpers.
            <span id="read_more" style="display:none">&mdash; <a href="#readme">Read more</a></span>
          </p>
        
      </div>

      <div id="repository_description_edit" style="display:none;" class="inline-edit">
        <form action="/kplatfoot/Calendar-DatePicker-for-Rails/admin/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="36fa6f38126267fef73488468a12137cc2f74287" /></div>
          <input type="hidden" name="field" value="repository_description">
          <input type="text" class="textfield" name="value" value="A simple JavaScript date picker with Rails helpers.">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>

      
      <div class="repository-homepage" id="repository_homepage" rel="repository_homepage_edit">
        <p><a href="http://www.maintaino.com/nuts-and-bolts/2010/01/04/building-a-calendar-datepicker-for-rails/" rel="nofollow">http://www.maintaino.com/nuts-and-bolts/2010/01/04/building-a-calendar-datepicker-for-rails/</a></p>
      </div>

      <div id="repository_homepage_edit" style="display:none;" class="inline-edit">
        <form action="/kplatfoot/Calendar-DatePicker-for-Rails/admin/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="36fa6f38126267fef73488468a12137cc2f74287" /></div>
          <input type="hidden" name="field" value="repository_homepage">
          <input type="text" class="textfield" name="value" value="http://www.maintaino.com/nuts-and-bolts/2010/01/04/building-a-calendar-datepicker-for-rails/">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>
      </div>
      <div class="rule "></div>
            <div id="url_box" class="url-box">
        <ul class="clone-urls">
          
            
            <li id="http_clone_url"><a href="https://github.com/kplatfoot/Calendar-DatePicker-for-Rails.git" data-permissions="Read-Only">HTTP</a></li>
            <li id="public_clone_url"><a href="git://github.com/kplatfoot/Calendar-DatePicker-for-Rails.git" data-permissions="Read-Only">Git Read-Only</a></li>
          
          
        </ul>
        <input type="text" spellcheck="false" id="url_field" class="url-field" />
              <span style="display:none" id="url_box_clippy"></span>
      <span id="clippy_tooltip_url_box_clippy" class="clippy-tooltip tooltipped" title="copy to clipboard">
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="14"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="https://assets3.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=url_box_clippy&amp;copied=&amp;copyto=">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="https://assets3.github.com/flash/clippy.swf?v5"
             width="14"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=url_box_clippy&amp;copied=&amp;copyto="
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      </span>

        <p id="url_description">This URL has <strong>Read+Write</strong> access</p>
      </div>
    </div>


        

      </div><!-- /.pagehead -->

      









<script type="text/javascript">
  GitHub.currentCommitRef = 'master'
  GitHub.currentRepoOwner = 'kplatfoot'
  GitHub.currentRepo = "Calendar-DatePicker-for-Rails"
  GitHub.downloadRepo = '/kplatfoot/Calendar-DatePicker-for-Rails/archives/master'
  GitHub.revType = "master"

  GitHub.controllerName = "blob"
  GitHub.actionName     = "show"
  GitHub.currentAction  = "blob#show"

  

  
</script>








  <div id="commit">
    <div class="group">
        
  <div class="envelope commit">
    <div class="human">
      
        <div class="message"><pre><a href="/kplatfoot/Calendar-DatePicker-for-Rails/commit/6973ff933d3dd1140efa5520d6d5e08bfc54012c">Hide calendar when user presses ESC.</a> </pre></div>
      

      <div class="actor">
        <div class="gravatar">
          
          <img src="https://secure.gravatar.com/avatar/6b62f8644e002a8feba50efcbfb7fa65?s=140&d=https%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="30" height="30"  />
        </div>
        <div class="name"><a href="/kplatfoot">kplatfoot</a> <span>(author)</span></div>
        <div class="date">
          <abbr class="relatize" title="2010-04-15 07:24:25">Thu Apr 15 07:24:25 -0700 2010</abbr>
        </div>
      </div>

      

    </div>
    <div class="machine">
      <span>c</span>ommit&nbsp;&nbsp;<a href="/kplatfoot/Calendar-DatePicker-for-Rails/commit/6973ff933d3dd1140efa5520d6d5e08bfc54012c" hotkey="c">6973ff933d3dd1140efa</a><br />
      <span>t</span>ree&nbsp;&nbsp;&nbsp;&nbsp;<a href="/kplatfoot/Calendar-DatePicker-for-Rails/tree/6973ff933d3dd1140efa5520d6d5e08bfc54012c" hotkey="t">823d4bd21ff2c75dbfa4</a><br />
      
        <span>p</span>arent&nbsp;
        
        <a href="/kplatfoot/Calendar-DatePicker-for-Rails/tree/a067292ab80f160ae71ec480f87315437f3e796e" hotkey="p">a067292ab80f160ae71e</a>
      

    </div>
  </div>

    </div>
  </div>



  
    <div id="path">
      <b><a href="/kplatfoot/Calendar-DatePicker-for-Rails/tree/master">Calendar-DatePicker-for-Rails</a></b> / <a href="/kplatfoot/Calendar-DatePicker-for-Rails/tree/master/public">public</a> / <a href="/kplatfoot/Calendar-DatePicker-for-Rails/tree/master/public/javascripts">javascripts</a> / datepicker.js       <span style="display:none" id="clippy_4816">public/javascripts/datepicker.js</span>
      
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="https://assets3.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=clippy_4816&amp;copied=copied!&amp;copyto=copy to clipboard">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="https://assets3.github.com/flash/clippy.swf?v5"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=clippy_4816&amp;copied=copied!&amp;copyto=copy to clipboard"
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      

    </div>

    <div id="files">
      <div class="file">
        <div class="meta">
          <div class="info">
            <span class="icon"><img alt="Txt" height="16" src="https://assets0.github.com/images/icons/txt.png?6594fe00e582252f3519fda74da9cb2e5b7dadf7" width="16" /></span>
            <span class="mode" title="File Mode">100755</span>
            
              <span>238 lines (196 sloc)</span>
            
            <span>7.944 kb</span>
          </div>
          <ul class="actions">
            
              <li><a id="file-edit-link" href="#" rel="/kplatfoot/Calendar-DatePicker-for-Rails/file-edit/__ref__/public/javascripts/datepicker.js">edit</a></li>
            
            <li><a href="/kplatfoot/Calendar-DatePicker-for-Rails/raw/master/public/javascripts/datepicker.js" id="raw-url">raw</a></li>
            
              <li><a href="/kplatfoot/Calendar-DatePicker-for-Rails/blame/master/public/javascripts/datepicker.js">blame</a></li>
            
            <li><a href="/kplatfoot/Calendar-DatePicker-for-Rails/commits/master/public/javascripts/datepicker.js">history</a></li>
          </ul>
        </div>
        
  <div class="data type-javascript">
    
      <table cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <pre class="line_numbers"><span id="LID1" rel="#L1">1</span>
<span id="LID2" rel="#L2">2</span>
<span id="LID3" rel="#L3">3</span>
<span id="LID4" rel="#L4">4</span>
<span id="LID5" rel="#L5">5</span>
<span id="LID6" rel="#L6">6</span>
<span id="LID7" rel="#L7">7</span>
<span id="LID8" rel="#L8">8</span>
<span id="LID9" rel="#L9">9</span>
<span id="LID10" rel="#L10">10</span>
<span id="LID11" rel="#L11">11</span>
<span id="LID12" rel="#L12">12</span>
<span id="LID13" rel="#L13">13</span>
<span id="LID14" rel="#L14">14</span>
<span id="LID15" rel="#L15">15</span>
<span id="LID16" rel="#L16">16</span>
<span id="LID17" rel="#L17">17</span>
<span id="LID18" rel="#L18">18</span>
<span id="LID19" rel="#L19">19</span>
<span id="LID20" rel="#L20">20</span>
<span id="LID21" rel="#L21">21</span>
<span id="LID22" rel="#L22">22</span>
<span id="LID23" rel="#L23">23</span>
<span id="LID24" rel="#L24">24</span>
<span id="LID25" rel="#L25">25</span>
<span id="LID26" rel="#L26">26</span>
<span id="LID27" rel="#L27">27</span>
<span id="LID28" rel="#L28">28</span>
<span id="LID29" rel="#L29">29</span>
<span id="LID30" rel="#L30">30</span>
<span id="LID31" rel="#L31">31</span>
<span id="LID32" rel="#L32">32</span>
<span id="LID33" rel="#L33">33</span>
<span id="LID34" rel="#L34">34</span>
<span id="LID35" rel="#L35">35</span>
<span id="LID36" rel="#L36">36</span>
<span id="LID37" rel="#L37">37</span>
<span id="LID38" rel="#L38">38</span>
<span id="LID39" rel="#L39">39</span>
<span id="LID40" rel="#L40">40</span>
<span id="LID41" rel="#L41">41</span>
<span id="LID42" rel="#L42">42</span>
<span id="LID43" rel="#L43">43</span>
<span id="LID44" rel="#L44">44</span>
<span id="LID45" rel="#L45">45</span>
<span id="LID46" rel="#L46">46</span>
<span id="LID47" rel="#L47">47</span>
<span id="LID48" rel="#L48">48</span>
<span id="LID49" rel="#L49">49</span>
<span id="LID50" rel="#L50">50</span>
<span id="LID51" rel="#L51">51</span>
<span id="LID52" rel="#L52">52</span>
<span id="LID53" rel="#L53">53</span>
<span id="LID54" rel="#L54">54</span>
<span id="LID55" rel="#L55">55</span>
<span id="LID56" rel="#L56">56</span>
<span id="LID57" rel="#L57">57</span>
<span id="LID58" rel="#L58">58</span>
<span id="LID59" rel="#L59">59</span>
<span id="LID60" rel="#L60">60</span>
<span id="LID61" rel="#L61">61</span>
<span id="LID62" rel="#L62">62</span>
<span id="LID63" rel="#L63">63</span>
<span id="LID64" rel="#L64">64</span>
<span id="LID65" rel="#L65">65</span>
<span id="LID66" rel="#L66">66</span>
<span id="LID67" rel="#L67">67</span>
<span id="LID68" rel="#L68">68</span>
<span id="LID69" rel="#L69">69</span>
<span id="LID70" rel="#L70">70</span>
<span id="LID71" rel="#L71">71</span>
<span id="LID72" rel="#L72">72</span>
<span id="LID73" rel="#L73">73</span>
<span id="LID74" rel="#L74">74</span>
<span id="LID75" rel="#L75">75</span>
<span id="LID76" rel="#L76">76</span>
<span id="LID77" rel="#L77">77</span>
<span id="LID78" rel="#L78">78</span>
<span id="LID79" rel="#L79">79</span>
<span id="LID80" rel="#L80">80</span>
<span id="LID81" rel="#L81">81</span>
<span id="LID82" rel="#L82">82</span>
<span id="LID83" rel="#L83">83</span>
<span id="LID84" rel="#L84">84</span>
<span id="LID85" rel="#L85">85</span>
<span id="LID86" rel="#L86">86</span>
<span id="LID87" rel="#L87">87</span>
<span id="LID88" rel="#L88">88</span>
<span id="LID89" rel="#L89">89</span>
<span id="LID90" rel="#L90">90</span>
<span id="LID91" rel="#L91">91</span>
<span id="LID92" rel="#L92">92</span>
<span id="LID93" rel="#L93">93</span>
<span id="LID94" rel="#L94">94</span>
<span id="LID95" rel="#L95">95</span>
<span id="LID96" rel="#L96">96</span>
<span id="LID97" rel="#L97">97</span>
<span id="LID98" rel="#L98">98</span>
<span id="LID99" rel="#L99">99</span>
<span id="LID100" rel="#L100">100</span>
<span id="LID101" rel="#L101">101</span>
<span id="LID102" rel="#L102">102</span>
<span id="LID103" rel="#L103">103</span>
<span id="LID104" rel="#L104">104</span>
<span id="LID105" rel="#L105">105</span>
<span id="LID106" rel="#L106">106</span>
<span id="LID107" rel="#L107">107</span>
<span id="LID108" rel="#L108">108</span>
<span id="LID109" rel="#L109">109</span>
<span id="LID110" rel="#L110">110</span>
<span id="LID111" rel="#L111">111</span>
<span id="LID112" rel="#L112">112</span>
<span id="LID113" rel="#L113">113</span>
<span id="LID114" rel="#L114">114</span>
<span id="LID115" rel="#L115">115</span>
<span id="LID116" rel="#L116">116</span>
<span id="LID117" rel="#L117">117</span>
<span id="LID118" rel="#L118">118</span>
<span id="LID119" rel="#L119">119</span>
<span id="LID120" rel="#L120">120</span>
<span id="LID121" rel="#L121">121</span>
<span id="LID122" rel="#L122">122</span>
<span id="LID123" rel="#L123">123</span>
<span id="LID124" rel="#L124">124</span>
<span id="LID125" rel="#L125">125</span>
<span id="LID126" rel="#L126">126</span>
<span id="LID127" rel="#L127">127</span>
<span id="LID128" rel="#L128">128</span>
<span id="LID129" rel="#L129">129</span>
<span id="LID130" rel="#L130">130</span>
<span id="LID131" rel="#L131">131</span>
<span id="LID132" rel="#L132">132</span>
<span id="LID133" rel="#L133">133</span>
<span id="LID134" rel="#L134">134</span>
<span id="LID135" rel="#L135">135</span>
<span id="LID136" rel="#L136">136</span>
<span id="LID137" rel="#L137">137</span>
<span id="LID138" rel="#L138">138</span>
<span id="LID139" rel="#L139">139</span>
<span id="LID140" rel="#L140">140</span>
<span id="LID141" rel="#L141">141</span>
<span id="LID142" rel="#L142">142</span>
<span id="LID143" rel="#L143">143</span>
<span id="LID144" rel="#L144">144</span>
<span id="LID145" rel="#L145">145</span>
<span id="LID146" rel="#L146">146</span>
<span id="LID147" rel="#L147">147</span>
<span id="LID148" rel="#L148">148</span>
<span id="LID149" rel="#L149">149</span>
<span id="LID150" rel="#L150">150</span>
<span id="LID151" rel="#L151">151</span>
<span id="LID152" rel="#L152">152</span>
<span id="LID153" rel="#L153">153</span>
<span id="LID154" rel="#L154">154</span>
<span id="LID155" rel="#L155">155</span>
<span id="LID156" rel="#L156">156</span>
<span id="LID157" rel="#L157">157</span>
<span id="LID158" rel="#L158">158</span>
<span id="LID159" rel="#L159">159</span>
<span id="LID160" rel="#L160">160</span>
<span id="LID161" rel="#L161">161</span>
<span id="LID162" rel="#L162">162</span>
<span id="LID163" rel="#L163">163</span>
<span id="LID164" rel="#L164">164</span>
<span id="LID165" rel="#L165">165</span>
<span id="LID166" rel="#L166">166</span>
<span id="LID167" rel="#L167">167</span>
<span id="LID168" rel="#L168">168</span>
<span id="LID169" rel="#L169">169</span>
<span id="LID170" rel="#L170">170</span>
<span id="LID171" rel="#L171">171</span>
<span id="LID172" rel="#L172">172</span>
<span id="LID173" rel="#L173">173</span>
<span id="LID174" rel="#L174">174</span>
<span id="LID175" rel="#L175">175</span>
<span id="LID176" rel="#L176">176</span>
<span id="LID177" rel="#L177">177</span>
<span id="LID178" rel="#L178">178</span>
<span id="LID179" rel="#L179">179</span>
<span id="LID180" rel="#L180">180</span>
<span id="LID181" rel="#L181">181</span>
<span id="LID182" rel="#L182">182</span>
<span id="LID183" rel="#L183">183</span>
<span id="LID184" rel="#L184">184</span>
<span id="LID185" rel="#L185">185</span>
<span id="LID186" rel="#L186">186</span>
<span id="LID187" rel="#L187">187</span>
<span id="LID188" rel="#L188">188</span>
<span id="LID189" rel="#L189">189</span>
<span id="LID190" rel="#L190">190</span>
<span id="LID191" rel="#L191">191</span>
<span id="LID192" rel="#L192">192</span>
<span id="LID193" rel="#L193">193</span>
<span id="LID194" rel="#L194">194</span>
<span id="LID195" rel="#L195">195</span>
<span id="LID196" rel="#L196">196</span>
<span id="LID197" rel="#L197">197</span>
<span id="LID198" rel="#L198">198</span>
<span id="LID199" rel="#L199">199</span>
<span id="LID200" rel="#L200">200</span>
<span id="LID201" rel="#L201">201</span>
<span id="LID202" rel="#L202">202</span>
<span id="LID203" rel="#L203">203</span>
<span id="LID204" rel="#L204">204</span>
<span id="LID205" rel="#L205">205</span>
<span id="LID206" rel="#L206">206</span>
<span id="LID207" rel="#L207">207</span>
<span id="LID208" rel="#L208">208</span>
<span id="LID209" rel="#L209">209</span>
<span id="LID210" rel="#L210">210</span>
<span id="LID211" rel="#L211">211</span>
<span id="LID212" rel="#L212">212</span>
<span id="LID213" rel="#L213">213</span>
<span id="LID214" rel="#L214">214</span>
<span id="LID215" rel="#L215">215</span>
<span id="LID216" rel="#L216">216</span>
<span id="LID217" rel="#L217">217</span>
<span id="LID218" rel="#L218">218</span>
<span id="LID219" rel="#L219">219</span>
<span id="LID220" rel="#L220">220</span>
<span id="LID221" rel="#L221">221</span>
<span id="LID222" rel="#L222">222</span>
<span id="LID223" rel="#L223">223</span>
<span id="LID224" rel="#L224">224</span>
<span id="LID225" rel="#L225">225</span>
<span id="LID226" rel="#L226">226</span>
<span id="LID227" rel="#L227">227</span>
<span id="LID228" rel="#L228">228</span>
<span id="LID229" rel="#L229">229</span>
<span id="LID230" rel="#L230">230</span>
<span id="LID231" rel="#L231">231</span>
<span id="LID232" rel="#L232">232</span>
<span id="LID233" rel="#L233">233</span>
<span id="LID234" rel="#L234">234</span>
<span id="LID235" rel="#L235">235</span>
<span id="LID236" rel="#L236">236</span>
<span id="LID237" rel="#L237">237</span>
<span id="LID238" rel="#L238">238</span>
</pre>
          </td>
          <td width="100%">
            
              
                <div class="highlight"><pre><div class='line' id='LC1'><span class="c1">// Copyright 2010 Keith Platfoot</span></div><div class='line' id='LC2'><br/></div><div class='line' id='LC3'><span class="kd">function</span> <span class="nx">DatePicker</span><span class="p">(</span><span class="nx">textboxId</span><span class="p">){</span></div><div class='line' id='LC4'>&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">textbox</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="nx">textboxId</span><span class="p">);</span></div><div class='line' id='LC5'>&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">div</span> <span class="o">=</span> <span class="nx">$</span><span class="p">(</span><span class="nx">textboxId</span> <span class="o">+</span> <span class="s2">"_datepicker"</span><span class="p">);</span></div><div class='line' id='LC6'>&nbsp;&nbsp;</div><div class='line' id='LC7'>&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">.</span><span class="nx">observe</span><span class="p">(</span><span class="s2">"focus"</span><span class="p">,</span> <span class="k">this</span><span class="p">.</span><span class="nx">onFocus</span><span class="p">.</span><span class="nx">bindAsEventListener</span><span class="p">(</span><span class="k">this</span><span class="p">));</span></div><div class='line' id='LC8'>&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">.</span><span class="nx">observe</span><span class="p">(</span><span class="s2">"click"</span><span class="p">,</span> <span class="k">this</span><span class="p">.</span><span class="nx">onClick</span><span class="p">.</span><span class="nx">bindAsEventListener</span><span class="p">(</span><span class="k">this</span><span class="p">));</span></div><div class='line' id='LC9'>&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">.</span><span class="nx">observe</span><span class="p">(</span><span class="s2">"blur"</span><span class="p">,</span> <span class="k">this</span><span class="p">.</span><span class="nx">onBlur</span><span class="p">.</span><span class="nx">bindAsEventListener</span><span class="p">(</span><span class="k">this</span><span class="p">));</span></div><div class='line' id='LC10'>&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">.</span><span class="nx">observe</span><span class="p">(</span><span class="s2">"keydown"</span><span class="p">,</span> <span class="k">this</span><span class="p">.</span><span class="nx">onKeyPress</span><span class="p">.</span><span class="nx">bindAsEventListener</span><span class="p">(</span><span class="k">this</span><span class="p">));</span></div><div class='line' id='LC11'>&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">observe</span><span class="p">(</span><span class="s2">"click"</span><span class="p">,</span> <span class="k">this</span><span class="p">.</span><span class="nx">onDivClick</span><span class="p">.</span><span class="nx">bindAsEventListener</span><span class="p">(</span><span class="k">this</span><span class="p">));</span></div><div class='line' id='LC12'><span class="p">}</span></div><div class='line' id='LC13'><br/></div><div class='line' id='LC14'><span class="nx">DatePicker</span><span class="p">.</span><span class="nx">DAY</span> <span class="o">=</span> <span class="mi">1000</span> <span class="o">*</span> <span class="mi">60</span> <span class="o">*</span> <span class="mi">60</span> <span class="o">*</span> <span class="mi">24</span><span class="p">;</span> <span class="c1">// ms in 1 day</span></div><div class='line' id='LC15'><span class="nx">DatePicker</span><span class="p">.</span><span class="nx">MONTH_NAMES</span> <span class="o">=</span> <span class="p">[</span><span class="s1">&#39;Jan&#39;</span><span class="p">,</span> <span class="s1">&#39;Feb&#39;</span><span class="p">,</span> <span class="s1">&#39;March&#39;</span><span class="p">,</span> <span class="s1">&#39;April&#39;</span><span class="p">,</span> <span class="s1">&#39;May&#39;</span><span class="p">,</span> <span class="s1">&#39;June&#39;</span><span class="p">,</span> <span class="s1">&#39;July&#39;</span><span class="p">,</span> <span class="s1">&#39;Aug&#39;</span><span class="p">,</span> <span class="s1">&#39;Sept&#39;</span><span class="p">,</span> <span class="s1">&#39;Oct&#39;</span><span class="p">,</span> <span class="s1">&#39;Nov&#39;</span><span class="p">,</span> <span class="s1">&#39;Dec&#39;</span><span class="p">];</span></div><div class='line' id='LC16'><br/></div><div class='line' id='LC17'><span class="nx">DatePicker</span><span class="p">.</span><span class="nx">prototype</span> <span class="o">=</span> <span class="p">{</span></div><div class='line' id='LC18'>&nbsp;&nbsp;<span class="nx">onDivClick</span><span class="o">:</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC19'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">keepVisible</span> <span class="o">=</span> <span class="o">!</span><span class="k">this</span><span class="p">.</span><span class="nx">dateSelected</span><span class="p">;</span></div><div class='line' id='LC20'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">.</span><span class="nx">focus</span><span class="p">();</span></div><div class='line' id='LC21'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC22'>&nbsp;&nbsp;</div><div class='line' id='LC23'>&nbsp;&nbsp;<span class="nx">popup</span><span class="o">:</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC24'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">visible</span><span class="p">())</span> <span class="p">{</span></div><div class='line' id='LC25'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">initCalendar</span><span class="p">();</span></div><div class='line' id='LC26'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">positionDiv</span><span class="p">();</span></div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">renderCalendar</span><span class="p">();</span></div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">show</span><span class="p">();</span></div><div class='line' id='LC29'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC30'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// This only works on Firefox if it&#39;s outside the if statement above.  No idea why.</span></div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">ensureCalendarVisible</span><span class="p">();</span></div><div class='line' id='LC32'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC33'>&nbsp;&nbsp;</div><div class='line' id='LC34'>&nbsp;&nbsp;<span class="nx">positionDiv</span><span class="o">:</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Position calendar div at bottom left edge of textbox</span></div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">position</span> <span class="o">||</span> <span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">position</span> <span class="o">==</span> <span class="s1">&#39;absolute&#39;</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">style</span><span class="p">.</span><span class="nx">position</span> <span class="o">=</span> <span class="s1">&#39;absolute&#39;</span><span class="p">;</span></div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">clonePosition</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">,</span> <span class="p">{</span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">setHeight</span><span class="o">:</span> <span class="kc">false</span><span class="p">,</span></div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">setWidth</span><span class="o">:</span> <span class="kc">false</span><span class="p">,</span></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">offsetTop</span><span class="o">:</span> <span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">.</span><span class="nx">offsetHeight</span></div><div class='line' id='LC42'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">});</span></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC44'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC45'>&nbsp;&nbsp;</div><div class='line' id='LC46'>&nbsp;&nbsp;<span class="nx">ensureCalendarVisible</span><span class="o">:</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">viewportHeight</span> <span class="o">=</span> <span class="nb">window</span><span class="p">.</span><span class="nx">innerHeight</span> <span class="o">||</span> <span class="nb">document</span><span class="p">.</span><span class="nx">documentElement</span><span class="p">.</span><span class="nx">clientHeight</span> <span class="o">||</span> <span class="nb">document</span><span class="p">.</span><span class="nx">body</span><span class="p">.</span><span class="nx">clientHeight</span><span class="p">;</span></div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">viewportOffsetY</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">viewportOffset</span><span class="p">().</span><span class="nx">top</span><span class="p">;</span></div><div class='line' id='LC49'><br/></div><div class='line' id='LC50'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// If the element is below the bottom of the viewport, scroll the element up into view</span></div><div class='line' id='LC51'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">viewportOffsetY</span> <span class="o">&gt;</span> <span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="nx">viewportOffsetY</span> <span class="o">+</span> <span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">getHeight</span><span class="p">()</span> <span class="o">&gt;</span> <span class="nx">viewportHeight</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC52'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">scrollIntoView</span><span class="p">(</span><span class="kc">false</span><span class="p">);</span></div><div class='line' id='LC53'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span>      </div><div class='line' id='LC54'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC55'>&nbsp;&nbsp;</div><div class='line' id='LC56'>&nbsp;&nbsp;<span class="nx">initCalendar</span><span class="o">:</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC57'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">dateSelected</span> <span class="o">=</span> <span class="kc">false</span><span class="p">;</span></div><div class='line' id='LC58'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC59'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Default to today</span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">selectedDate</span> <span class="o">=</span> <span class="k">new</span> <span class="nb">Date</span><span class="p">();</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC62'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Try to get the date from the textbox</span></div><div class='line' id='LC63'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">match</span> <span class="o">=</span> <span class="nx">$F</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">).</span><span class="nx">match</span><span class="p">(</span><span class="sr">/^(\d{1,2})[\/-](\d{1,2})[\/-](\d{2,4})$/</span><span class="p">);</span></div><div class='line' id='LC64'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">match</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC65'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Convert the values into a proper JS date object</span></div><div class='line' id='LC66'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">month</span> <span class="o">=</span> <span class="nb">Number</span><span class="p">(</span><span class="nx">match</span><span class="p">[</span><span class="mi">1</span><span class="p">])</span> <span class="o">-</span> <span class="mi">1</span><span class="p">;</span></div><div class='line' id='LC67'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">day</span> <span class="o">=</span> <span class="nb">Number</span><span class="p">(</span><span class="nx">match</span><span class="p">[</span><span class="mi">2</span><span class="p">]);</span></div><div class='line' id='LC68'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">year</span> <span class="o">=</span> <span class="nb">Number</span><span class="p">(</span><span class="nx">match</span><span class="p">[</span><span class="mi">3</span><span class="p">]);</span></div><div class='line' id='LC69'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">year</span> <span class="o">&lt;</span> <span class="mi">100</span><span class="p">)</span> </div><div class='line' id='LC70'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">year</span> <span class="o">+=</span> <span class="p">(</span><span class="nx">year</span> <span class="o">&lt;</span> <span class="mi">25</span> <span class="o">?</span> <span class="mi">2000</span> <span class="o">:</span> <span class="mi">1900</span><span class="p">);</span></div><div class='line' id='LC71'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC72'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">date</span> <span class="o">=</span> <span class="k">new</span> <span class="nb">Date</span><span class="p">(</span><span class="nx">year</span><span class="p">,</span> <span class="nx">month</span><span class="p">,</span> <span class="nx">day</span><span class="p">);</span></div><div class='line' id='LC73'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC74'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// If date is valid, set it as the selected date</span></div><div class='line' id='LC75'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">date</span> <span class="o">&amp;&amp;</span> <span class="nx">date</span><span class="p">.</span><span class="nx">getDate</span><span class="p">()</span> <span class="o">==</span> <span class="nx">day</span> <span class="o">&amp;&amp;</span> <span class="nx">date</span><span class="p">.</span><span class="nx">getMonth</span><span class="p">()</span> <span class="o">==</span> <span class="nx">month</span> <span class="o">&amp;&amp;</span> <span class="nx">date</span><span class="p">.</span><span class="nx">getFullYear</span><span class="p">()</span> <span class="o">==</span> <span class="nx">year</span><span class="p">)</span> </div><div class='line' id='LC76'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">selectedDate</span> <span class="o">=</span> <span class="nx">date</span><span class="p">;</span></div><div class='line' id='LC77'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC78'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC79'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">calendarYear</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">selectedDate</span><span class="p">.</span><span class="nx">getFullYear</span><span class="p">();</span></div><div class='line' id='LC80'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">selectedDate</span><span class="p">.</span><span class="nx">getMonth</span><span class="p">();</span></div><div class='line' id='LC81'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC82'>&nbsp;&nbsp;</div><div class='line' id='LC83'>&nbsp;&nbsp;<span class="nx">onFocus</span><span class="o">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">event</span><span class="p">){</span></div><div class='line' id='LC84'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">popup</span><span class="p">();</span></div><div class='line' id='LC85'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC86'>&nbsp;&nbsp;</div><div class='line' id='LC87'>&nbsp;&nbsp;<span class="nx">onClick</span><span class="o">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">event</span><span class="p">){</span></div><div class='line' id='LC88'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">popup</span><span class="p">();</span></div><div class='line' id='LC89'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC90'>&nbsp;&nbsp;</div><div class='line' id='LC91'>&nbsp;&nbsp;<span class="nx">onBlur</span><span class="o">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">event</span><span class="p">){</span></div><div class='line' id='LC92'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">hide</span><span class="p">();</span></div><div class='line' id='LC93'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC94'>&nbsp;&nbsp;</div><div class='line' id='LC95'>&nbsp;&nbsp;<span class="nx">onKeyPress</span><span class="o">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">event</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC96'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">switch</span> <span class="p">(</span><span class="nx">event</span><span class="p">.</span><span class="nx">keyCode</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC97'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">case</span> <span class="nx">Event</span><span class="p">.</span><span class="nx">KEY_ESC</span><span class="o">:</span></div><div class='line' id='LC98'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">hide</span><span class="p">();</span></div><div class='line' id='LC99'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">Event</span><span class="p">.</span><span class="nx">stop</span><span class="p">(</span><span class="nx">event</span><span class="p">);</span></div><div class='line' id='LC100'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span><span class="p">;</span></div><div class='line' id='LC101'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC102'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC103'>&nbsp;&nbsp;</div><div class='line' id='LC104'>&nbsp;&nbsp;<span class="nx">hide</span><span class="o">:</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC105'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Cancel any pending delayedHide&#39;s</span></div><div class='line' id='LC106'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">hideTimeoutId</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC107'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">clearTimeout</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">hideTimeoutId</span><span class="p">);</span></div><div class='line' id='LC108'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC109'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC110'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// We need to delay the hide, since the month switch steals focus from textbox</span></div><div class='line' id='LC111'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">delayedHide</span> <span class="o">=</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC112'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">hideTimeoutId</span> <span class="o">=</span> <span class="kc">null</span><span class="p">;</span></div><div class='line' id='LC113'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="k">this</span><span class="p">.</span><span class="nx">keepVisible</span><span class="p">)</span> </div><div class='line' id='LC114'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">hide</span><span class="p">();</span></div><div class='line' id='LC115'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span> </div><div class='line' id='LC116'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">keepVisible</span> <span class="o">=</span> <span class="kc">false</span><span class="p">;</span></div><div class='line' id='LC117'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">};</span></div><div class='line' id='LC118'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">hideTimeoutId</span> <span class="o">=</span> <span class="nx">setTimeout</span><span class="p">(</span><span class="nx">delayedHide</span><span class="p">.</span><span class="nx">bind</span><span class="p">(</span><span class="k">this</span><span class="p">),</span> <span class="mi">200</span><span class="p">);</span></div><div class='line' id='LC119'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC120'>&nbsp;&nbsp;</div><div class='line' id='LC121'>&nbsp;&nbsp;<span class="nx">renderCalendar</span><span class="o">:</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC122'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Build the calendar frame</span></div><div class='line' id='LC123'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">table</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"table"</span><span class="p">,</span> <span class="p">{</span> <span class="nx">cellPadding</span><span class="o">:</span> <span class="s2">"4"</span><span class="p">,</span> <span class="nx">cellSpacing</span><span class="o">:</span> <span class="s2">"0"</span> <span class="p">});</span></div><div class='line' id='LC124'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">tbody</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"tbody"</span><span class="p">);</span></div><div class='line' id='LC125'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">table</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">tbody</span><span class="p">);</span></div><div class='line' id='LC126'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">headerRow</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"tr"</span><span class="p">);</span></div><div class='line' id='LC127'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">tbody</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">headerRow</span><span class="p">);</span></div><div class='line' id='LC128'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC129'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">headerLeft</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"td"</span><span class="p">);</span></div><div class='line' id='LC130'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">headerRow</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">headerLeft</span><span class="p">);</span></div><div class='line' id='LC131'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">prevMonthDiv</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"div"</span><span class="p">,</span> <span class="p">{</span> <span class="s2">"class"</span><span class="o">:</span> <span class="s2">"changeMonthLink"</span> <span class="p">}).</span><span class="nx">update</span><span class="p">(</span><span class="s2">"&amp;lt;&amp;lt;"</span><span class="p">);</span></div><div class='line' id='LC132'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">prevMonthDiv</span><span class="p">.</span><span class="nx">observe</span><span class="p">(</span><span class="s2">"click"</span><span class="p">,</span> <span class="k">this</span><span class="p">.</span><span class="nx">prevMonth</span><span class="p">.</span><span class="nx">bind</span><span class="p">(</span><span class="k">this</span><span class="p">));</span></div><div class='line' id='LC133'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">headerLeft</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">prevMonthDiv</span><span class="p">);</span></div><div class='line' id='LC134'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC135'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">monthText</span> <span class="o">=</span> <span class="nx">DatePicker</span><span class="p">.</span><span class="nx">MONTH_NAMES</span><span class="p">[</span><span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span><span class="p">]</span> <span class="o">+</span> <span class="s1">&#39; &#39;</span> <span class="o">+</span> <span class="k">this</span><span class="p">.</span><span class="nx">calendarYear</span></div><div class='line' id='LC136'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">headerCenter</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"td"</span><span class="p">,</span> <span class="p">{</span> <span class="s2">"class"</span><span class="o">:</span> <span class="s2">"monthName"</span><span class="p">,</span> <span class="nx">colSpan</span><span class="o">:</span> <span class="s2">"5"</span><span class="p">,</span> <span class="nx">align</span><span class="o">:</span> <span class="s2">"center"</span> <span class="p">}).</span><span class="nx">update</span><span class="p">(</span><span class="nx">monthText</span><span class="p">);</span></div><div class='line' id='LC137'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">headerRow</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">headerCenter</span><span class="p">);</span></div><div class='line' id='LC138'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC139'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">headerRight</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"td"</span><span class="p">);</span></div><div class='line' id='LC140'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">headerRow</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">headerRight</span><span class="p">);</span></div><div class='line' id='LC141'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">nextMonthDiv</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"div"</span><span class="p">,</span> <span class="p">{</span> <span class="s2">"class"</span><span class="o">:</span> <span class="s2">"changeMonthLink"</span> <span class="p">}).</span><span class="nx">update</span><span class="p">(</span><span class="s2">"&amp;gt;&amp;gt;"</span><span class="p">);</span></div><div class='line' id='LC142'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">nextMonthDiv</span><span class="p">.</span><span class="nx">observe</span><span class="p">(</span><span class="s2">"click"</span><span class="p">,</span> <span class="k">this</span><span class="p">.</span><span class="nx">nextMonth</span><span class="p">.</span><span class="nx">bind</span><span class="p">(</span><span class="k">this</span><span class="p">));</span></div><div class='line' id='LC143'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">headerRight</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">nextMonthDiv</span><span class="p">);</span></div><div class='line' id='LC144'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC145'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">daysRow</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"tr"</span><span class="p">);</span></div><div class='line' id='LC146'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">[</span><span class="s1">&#39;S&#39;</span><span class="p">,</span> <span class="s1">&#39;M&#39;</span><span class="p">,</span> <span class="s1">&#39;T&#39;</span><span class="p">,</span> <span class="s1">&#39;W&#39;</span><span class="p">,</span> <span class="s1">&#39;T&#39;</span><span class="p">,</span> <span class="s1">&#39;F&#39;</span><span class="p">,</span> <span class="s1">&#39;S&#39;</span><span class="p">].</span><span class="nx">each</span><span class="p">(</span><span class="kd">function</span><span class="p">(</span><span class="nx">abbr</span><span class="p">){</span></div><div class='line' id='LC147'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">dayAbbrCell</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"td"</span><span class="p">,</span> <span class="p">{</span> <span class="s2">"class"</span><span class="o">:</span> <span class="s2">"weekdayName"</span><span class="p">,</span> <span class="nx">align</span><span class="o">:</span> <span class="s2">"center"</span> <span class="p">}).</span><span class="nx">update</span><span class="p">(</span><span class="nx">abbr</span><span class="p">);</span></div><div class='line' id='LC148'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">daysRow</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">dayAbbrCell</span><span class="p">);</span></div><div class='line' id='LC149'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">});</span></div><div class='line' id='LC150'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">tbody</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">daysRow</span><span class="p">);</span></div><div class='line' id='LC151'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC152'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">monthFirstDay</span> <span class="o">=</span> <span class="k">new</span> <span class="nb">Date</span><span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">calendarYear</span><span class="p">,</span> <span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="mi">12</span><span class="p">);</span></div><div class='line' id='LC153'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">calendarFirstDay</span> <span class="o">=</span> <span class="k">new</span> <span class="nb">Date</span><span class="p">(</span><span class="nx">monthFirstDay</span><span class="p">.</span><span class="nx">getTime</span><span class="p">()</span> <span class="o">-</span> <span class="nx">monthFirstDay</span><span class="p">.</span><span class="nx">getDay</span><span class="p">()</span> <span class="o">*</span> <span class="nx">DatePicker</span><span class="p">.</span><span class="nx">DAY</span><span class="p">);</span></div><div class='line' id='LC154'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC155'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Build the calendar cells        </span></div><div class='line' id='LC156'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">d</span> <span class="o">=</span> <span class="nx">calendarFirstDay</span><span class="p">;</span></div><div class='line' id='LC157'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">for</span> <span class="p">(</span><span class="kd">var</span> <span class="nx">week</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span> <span class="nx">week</span> <span class="o">&lt;</span> <span class="mi">6</span><span class="p">;</span> <span class="nx">week</span><span class="o">++</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC158'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">weekRow</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"tr"</span><span class="p">);</span></div><div class='line' id='LC159'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">for</span> <span class="p">(</span><span class="kd">var</span> <span class="nx">weekday</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span> <span class="nx">weekday</span> <span class="o">&lt;</span> <span class="mi">7</span><span class="p">;</span> <span class="nx">weekday</span><span class="o">++</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC160'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">classNames</span> <span class="o">=</span> <span class="s1">&#39;day&#39;</span><span class="p">;</span></div><div class='line' id='LC161'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC162'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">today</span> <span class="o">=</span> <span class="k">new</span> <span class="nb">Date</span><span class="p">();</span></div><div class='line' id='LC163'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">d</span><span class="p">.</span><span class="nx">getDate</span><span class="p">()</span> <span class="o">==</span> <span class="nx">today</span><span class="p">.</span><span class="nx">getDate</span><span class="p">()</span> <span class="o">&amp;&amp;</span> <span class="nx">d</span><span class="p">.</span><span class="nx">getMonth</span><span class="p">()</span> <span class="o">==</span> <span class="nx">today</span><span class="p">.</span><span class="nx">getMonth</span><span class="p">()</span> <span class="o">&amp;&amp;</span> <span class="nx">d</span><span class="p">.</span><span class="nx">getFullYear</span><span class="p">()</span> <span class="o">==</span> <span class="nx">today</span><span class="p">.</span><span class="nx">getFullYear</span><span class="p">())</span> </div><div class='line' id='LC164'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">classNames</span> <span class="o">+=</span> <span class="s2">" today"</span><span class="p">;</span></div><div class='line' id='LC165'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC166'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">selectedDate</span> <span class="o">&amp;&amp;</span> <span class="nx">d</span><span class="p">.</span><span class="nx">getDate</span><span class="p">()</span> <span class="o">==</span> <span class="k">this</span><span class="p">.</span><span class="nx">selectedDate</span><span class="p">.</span><span class="nx">getDate</span><span class="p">()</span> <span class="o">&amp;&amp;</span> <span class="nx">d</span><span class="p">.</span><span class="nx">getMonth</span><span class="p">()</span> <span class="o">==</span> <span class="k">this</span><span class="p">.</span><span class="nx">selectedDate</span><span class="p">.</span><span class="nx">getMonth</span><span class="p">()</span> <span class="o">&amp;&amp;</span> <span class="nx">d</span><span class="p">.</span><span class="nx">getFullYear</span><span class="p">()</span> <span class="o">==</span> <span class="k">this</span><span class="p">.</span><span class="nx">selectedDate</span><span class="p">.</span><span class="nx">getFullYear</span><span class="p">())</span> </div><div class='line' id='LC167'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">classNames</span> <span class="o">+=</span> <span class="s2">" daySelected"</span><span class="p">;</span></div><div class='line' id='LC168'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span> </div><div class='line' id='LC169'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">d</span><span class="p">.</span><span class="nx">getMonth</span><span class="p">()</span> <span class="o">==</span> <span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span><span class="p">)</span> </div><div class='line' id='LC170'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">classNames</span> <span class="o">+=</span> <span class="s2">" dayInMonth"</span><span class="p">;</span></div><div class='line' id='LC171'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span> </div><div class='line' id='LC172'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">classNames</span> <span class="o">+=</span> <span class="s2">" dayOutsideMonth"</span><span class="p">;</span></div><div class='line' id='LC173'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC174'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Create this day&#39;s cell</span></div><div class='line' id='LC175'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">dayCell</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Element</span><span class="p">(</span><span class="s2">"td"</span><span class="p">,</span> <span class="p">{</span> <span class="s2">"class"</span><span class="o">:</span> <span class="nx">classNames</span><span class="p">,</span> <span class="nx">align</span><span class="o">:</span> <span class="s2">"center"</span> <span class="p">}).</span><span class="nx">update</span><span class="p">(</span><span class="nx">d</span><span class="p">.</span><span class="nx">getDate</span><span class="p">().</span><span class="nx">toString</span><span class="p">());</span></div><div class='line' id='LC176'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">weekRow</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">dayCell</span><span class="p">);</span></div><div class='line' id='LC177'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC178'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Create a closure for this day&#39;s selector function</span></div><div class='line' id='LC179'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">dayLinkFunc</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">dateLinkFunc</span><span class="p">(</span><span class="nx">d</span><span class="p">);</span></div><div class='line' id='LC180'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">dayCell</span><span class="p">.</span><span class="nx">observe</span><span class="p">(</span><span class="s2">"click"</span><span class="p">,</span> <span class="nx">dayLinkFunc</span><span class="p">.</span><span class="nx">bind</span><span class="p">(</span><span class="k">this</span><span class="p">));</span></div><div class='line' id='LC181'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC182'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Move on to the next day</span></div><div class='line' id='LC183'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">d</span><span class="p">.</span><span class="nx">setTime</span><span class="p">(</span><span class="nx">d</span><span class="p">.</span><span class="nx">getTime</span><span class="p">()</span> <span class="o">+</span> <span class="nx">DatePicker</span><span class="p">.</span><span class="nx">DAY</span><span class="p">);</span></div><div class='line' id='LC184'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC185'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC186'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">tbody</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">weekRow</span><span class="p">);</span></div><div class='line' id='LC187'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC188'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">d</span><span class="p">.</span><span class="nx">getMonth</span><span class="p">()</span> <span class="o">!=</span> <span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span><span class="p">)</span> </div><div class='line' id='LC189'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">break</span><span class="p">;</span></div><div class='line' id='LC190'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC191'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC192'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Remove the old month&#39;s content, if necessary</span></div><div class='line' id='LC193'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">currentChild</span> <span class="o">=</span> <span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">firstDescendant</span><span class="p">();</span></div><div class='line' id='LC194'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">currentChild</span><span class="p">)</span> </div><div class='line' id='LC195'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">$</span><span class="p">(</span><span class="nx">currentChild</span><span class="p">).</span><span class="nx">remove</span><span class="p">();</span></div><div class='line' id='LC196'>&nbsp;&nbsp;&nbsp;&nbsp;</div><div class='line' id='LC197'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">div</span><span class="p">.</span><span class="nx">appendChild</span><span class="p">(</span><span class="nx">table</span><span class="p">);</span></div><div class='line' id='LC198'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC199'>&nbsp;&nbsp;</div><div class='line' id='LC200'>&nbsp;&nbsp;<span class="nx">selectDate</span><span class="o">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">date</span><span class="p">){</span></div><div class='line' id='LC201'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">.</span><span class="nx">value</span> <span class="o">=</span> <span class="p">(</span><span class="nx">date</span><span class="p">.</span><span class="nx">getMonth</span><span class="p">()</span> <span class="o">+</span> <span class="mi">1</span><span class="p">)</span> <span class="o">+</span> <span class="s2">"/"</span> <span class="o">+</span> <span class="nx">date</span><span class="p">.</span><span class="nx">getDate</span><span class="p">()</span> <span class="o">+</span> <span class="s2">"/"</span> <span class="o">+</span> <span class="nx">date</span><span class="p">.</span><span class="nx">getFullYear</span><span class="p">();</span></div><div class='line' id='LC202'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">textbox</span><span class="p">.</span><span class="nx">focus</span><span class="p">();</span></div><div class='line' id='LC203'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">keepVisible</span> <span class="o">=</span> <span class="kc">false</span><span class="p">;</span></div><div class='line' id='LC204'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">dateSelected</span> <span class="o">=</span> <span class="kc">true</span><span class="p">;</span></div><div class='line' id='LC205'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">hide</span><span class="p">();</span></div><div class='line' id='LC206'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC207'>&nbsp;&nbsp;</div><div class='line' id='LC208'>&nbsp;&nbsp;<span class="nx">dateLinkFunc</span><span class="o">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">date</span><span class="p">){</span></div><div class='line' id='LC209'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">copy</span> <span class="o">=</span> <span class="k">new</span> <span class="nb">Date</span><span class="p">(</span><span class="nx">date</span><span class="p">.</span><span class="nx">getTime</span><span class="p">());</span></div><div class='line' id='LC210'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC211'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">selectDate</span><span class="p">(</span><span class="nx">copy</span><span class="p">);</span></div><div class='line' id='LC212'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">};</span></div><div class='line' id='LC213'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC214'>&nbsp;&nbsp;</div><div class='line' id='LC215'>&nbsp;&nbsp;<span class="nx">prevMonth</span><span class="o">:</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC216'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">changeMonth</span><span class="p">(</span><span class="o">-</span><span class="mi">1</span><span class="p">);</span></div><div class='line' id='LC217'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC218'>&nbsp;&nbsp;</div><div class='line' id='LC219'>&nbsp;&nbsp;<span class="nx">nextMonth</span><span class="o">:</span> <span class="kd">function</span><span class="p">(){</span></div><div class='line' id='LC220'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">changeMonth</span><span class="p">(</span><span class="mi">1</span><span class="p">);</span></div><div class='line' id='LC221'>&nbsp;&nbsp;<span class="p">},</span></div><div class='line' id='LC222'>&nbsp;&nbsp;</div><div class='line' id='LC223'>&nbsp;&nbsp;<span class="nx">changeMonth</span><span class="o">:</span> <span class="kd">function</span><span class="p">(</span><span class="nx">delta</span><span class="p">){</span></div><div class='line' id='LC224'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span> <span class="o">+=</span> <span class="nx">delta</span><span class="p">;</span></div><div class='line' id='LC225'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span> <span class="o">==</span> <span class="mi">12</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC226'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span></div><div class='line' id='LC227'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">calendarYear</span><span class="o">++</span><span class="p">;</span></div><div class='line' id='LC228'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC229'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span> </div><div class='line' id='LC230'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span> <span class="o">==</span> <span class="o">-</span><span class="mi">1</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC231'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">calendarMonth</span> <span class="o">=</span> <span class="mi">11</span><span class="p">;</span></div><div class='line' id='LC232'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">calendarYear</span><span class="o">--</span><span class="p">;</span></div><div class='line' id='LC233'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC234'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">renderCalendar</span><span class="p">();</span></div><div class='line' id='LC235'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">this</span><span class="p">.</span><span class="nx">onDivClick</span><span class="p">();</span> <span class="c1">// IE doesn&#39;t bubble up to this, so call it manually</span></div><div class='line' id='LC236'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC237'><span class="p">}</span></div><div class='line' id='LC238'><br/></div></pre></div>
              
            
          </td>
        </tr>
      </table>
    
  </div>


      </div>
    </div>
  


    </div>
  
      
    </div>

    <div id="footer" class="clearfix">
      <div class="site">
        <div class="sponsor">
          <a href="http://www.rackspace.com" class="logo">
            <img alt="Dedicated Server" src="https://assets0.github.com/images/modules/footer/rackspace_logo.png?v2?6594fe00e582252f3519fda74da9cb2e5b7dadf7" />
          </a>
          Powered by the <a href="http://www.rackspace.com ">Dedicated
          Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
          Computing</a> of Rackspace Hosting<span>&reg;</span>
        </div>

        <ul class="links">
          <li class="blog"><a href="https://github.com/blog">Blog</a></li>
          <li><a href="http://support.github.com">Support</a></li>
          <li><a href="https://github.com/training">Training</a></li>
          <li><a href="http://jobs.github.com">Job Board</a></li>
          <li><a href="http://shop.github.com">Shop</a></li>
          <li><a href="https://github.com/contact">Contact</a></li>
          <li><a href="http://develop.github.com">API</a></li>
          <li><a href="http://status.github.com">Status</a></li>
        </ul>
        <ul class="sosueme">
          <li class="main">&copy; 2010 <span id="_rrt" title="0.45262s from fe3.rs.github.com">GitHub</span> Inc. All rights reserved.</li>
          <li><a href="/site/terms">Terms of Service</a></li>
          <li><a href="/site/privacy">Privacy</a></li>
          <li><a href="https://github.com/security">Security</a></li>
        </ul>
      </div>
    </div><!-- /#footer -->

    
      
      
        <!-- current locale:  -->
        <div class="locales">
          <div class="site">

            <ul class="choices clearfix limited-locales">
              <li><span class="current">English</span></li>
              
                  <li><a rel="nofollow" href="?locale=de">Deutsch</a></li>
              
                  <li><a rel="nofollow" href="?locale=fr">Français</a></li>
              
                  <li><a rel="nofollow" href="?locale=ja">日本語</a></li>
              
                  <li><a rel="nofollow" href="?locale=pt-BR">Português (BR)</a></li>
              
                  <li><a rel="nofollow" href="?locale=ru">Русский</a></li>
              
                  <li><a rel="nofollow" href="?locale=zh">中文</a></li>
              
              <li class="all"><a href="#" class="minibutton btn-forward js-all-locales"><span><span class="icon"></span>See all available languages</span></a></li>
            </ul>

            <div class="all-locales clearfix">
              <h3>Your current locale selection: <strong>English</strong>. Choose another?</h3>
              
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=en">English</a></li>
                  
                      <li><a rel="nofollow" href="?locale=af">Afrikaans</a></li>
                  
                      <li><a rel="nofollow" href="?locale=ca">Català</a></li>
                  
                      <li><a rel="nofollow" href="?locale=cs">Čeština</a></li>
                  
                </ul>
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=de">Deutsch</a></li>
                  
                      <li><a rel="nofollow" href="?locale=es">Español</a></li>
                  
                      <li><a rel="nofollow" href="?locale=fr">Français</a></li>
                  
                      <li><a rel="nofollow" href="?locale=hr">Hrvatski</a></li>
                  
                </ul>
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=id">Indonesia</a></li>
                  
                      <li><a rel="nofollow" href="?locale=it">Italiano</a></li>
                  
                      <li><a rel="nofollow" href="?locale=ja">日本語</a></li>
                  
                      <li><a rel="nofollow" href="?locale=nl">Nederlands</a></li>
                  
                </ul>
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=no">Norsk</a></li>
                  
                      <li><a rel="nofollow" href="?locale=pl">Polski</a></li>
                  
                      <li><a rel="nofollow" href="?locale=pt-BR">Português (BR)</a></li>
                  
                      <li><a rel="nofollow" href="?locale=ru">Русский</a></li>
                  
                </ul>
              
                <ul class="choices">
                  
                      <li><a rel="nofollow" href="?locale=sr">Српски</a></li>
                  
                      <li><a rel="nofollow" href="?locale=sv">Svenska</a></li>
                  
                      <li><a rel="nofollow" href="?locale=zh">中文</a></li>
                  
                </ul>
              
            </div>

          </div>
          <div class="fade"></div>
        </div>
      
    

    <script>window._auth_token = "36fa6f38126267fef73488468a12137cc2f74287"</script>
    <div id="keyboard_shortcuts_pane" style="display:none">
  <h2>Keyboard Shortcuts</h2>

  <div class="columns threecols">
    <div class="column first">
      <h3>Site wide shortcuts</h3>
      <dl class="keyboard-mappings">
        <dt>s</dt>
        <dd>Focus site search</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>?</dt>
        <dd>Bring up this help dialog</dd>
      </dl>
    </div><!-- /.column.first -->
    <div class="column middle">
      <h3>Commit list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>t</dt>
        <dd>Open tree</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>p</dt>
        <dd>Open parent</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>c <em>or</em> o <em>or</em> enter</dt>
        <dd>Open commit</dd>
      </dl>
    </div><!-- /.column.first -->
    <div class="column last">
      <h3>Pull request list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
    </div><!-- /.columns.last -->
  </div><!-- /.columns.equacols -->

  <div class="rule"></div>

  <h3>Issues</h3>

  <div class="columns threecols">
    <div class="column first">
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>x</dt>
        <dd>Toggle select target</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
    </div><!-- /.column.first -->
    <div class="column middle">
      <dl class="keyboard-mappings">
        <dt>I</dt>
        <dd>Mark selected as read</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>U</dt>
        <dd>Mark selected as unread</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>e</dt>
        <dd>Close selected</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>y</dt>
        <dd>Remove selected from view</dd>
      </dl>
    </div><!-- /.column.middle -->
    <div class="column last">
      <dl class="keyboard-mappings">
        <dt>c</dt>
        <dd>Create issue</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>l</dt>
        <dd>Create label</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>i</dt>
        <dd>Back to inbox</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>u</dt>
        <dd>Back to issues</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>/</dt>
        <dd>Focus issues search</dd>
      </dl>
    </div>
  </div>

  <div class="rule"></div>

  <h3>Network Graph</h3>
  <div class="columns equacols">
    <div class="column first">
      <dl class="keyboard-mappings">
        <dt>← <em>or</em> h</dt>
        <dd>Scroll left</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>→ <em>or</em> l</dt>
        <dd>Scroll right</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>↑ <em>or</em> k</dt>
        <dd>Scroll up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>↓ <em>or</em> j</dt>
        <dd>Scroll down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>t</dt>
        <dd>Toggle visibility of head labels</dd>
      </dl>
    </div><!-- /.column.first -->
    <div class="column last">
      <dl class="keyboard-mappings">
        <dt>shift ← <em>or</em> shift h</dt>
        <dd>Scroll all the way left</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>shift → <em>or</em> shift l</dt>
        <dd>Scroll all the way right</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>shift ↑ <em>or</em> shift k</dt>
        <dd>Scroll all the way up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>shift ↓ <em>or</em> shift j</dt>
        <dd>Scroll all the way down</dd>
      </dl>
    </div><!-- /.column.last -->
  </div>

</div>
    

    <!--[if IE 8]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie8")
    </script>
    <![endif]-->

    <!--[if IE 7]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie7")
    </script>
    <![endif]-->

    <script type="text/javascript">
      _kmq.push(['trackClick', 'entice-signup-button', 'Entice banner clicked']);
      
    </script>
    
  </body>
</html>

