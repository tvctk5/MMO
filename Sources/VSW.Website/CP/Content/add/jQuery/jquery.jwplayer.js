if(typeof jwplayer=="undefined"){
    var jwplayer=function(a){
        if(jwplayer.api){
            return jwplayer.api.selectPlayer(a)
            }
        };
    
var $jw=jwplayer;
jwplayer.version="5.8.2011";
jwplayer.vid=document.createElement("video");
jwplayer.audio=document.createElement("audio");
jwplayer.source=document.createElement("source");
(function(b){
    b.utils=function(){};
    
    b.utils.typeOf=function(d){
        var c=typeof d;
        if(c==="object"){
            if(d){
                if(d instanceof Array){
                    c="array"
                    }
                }else{
            c="null"
            }
        }
    return c
};

b.utils.extend=function(){
    var c=b.utils.extend["arguments"];
    if(c.length>1){
        for(var e=1;e<c.length;e++){
            for(var d in c[e]){
                c[0][d]=c[e][d]
                }
            }
            return c[0]
    }
    return null
};

b.utils.clone=function(f){
    var c;
    var d=b.utils.clone["arguments"];
    if(d.length==1){
        switch(b.utils.typeOf(d[0])){
            case"object":
                c={};
                
                for(var e in d[0]){
                c[e]=b.utils.clone(d[0][e])
                }
                break;
            case"array":
                c=[];
                for(var e in d[0]){
                c[e]=b.utils.clone(d[0][e])
                }
                break;
            default:
                return d[0];
                break
                }
            }
    return c
};

b.utils.extension=function(c){
    if(!c){
        return""
        }
        c=c.substring(c.lastIndexOf("/")+1,c.length);
    c=c.split("?")[0];
    if(c.lastIndexOf(".")>-1){
        return c.substr(c.lastIndexOf(".")+1,c.length).toLowerCase()
        }
        return
};

b.utils.html=function(c,d){
    c.innerHTML=d
    };
    
b.utils.wrap=function(c,d){
    if(c.parentNode){
        c.parentNode.replaceChild(d,c)
        }
        d.appendChild(c)
    };
    
b.utils.ajax=function(g,f,c){
    var e;
    if(window.XMLHttpRequest){
        e=new XMLHttpRequest()
        }else{
        e=new ActiveXObject("Microsoft.XMLHTTP")
        }
        e.onreadystatechange=function(){
        if(e.readyState===4){
            if(e.status===200){
                if(f){
                    if(!b.utils.exists(e.responseXML)){
                        try{
                            if(window.DOMParser){
                                var h=(new DOMParser()).parseFromString(e.responseText,"text/xml");
                                if(h){
                                    e=b.utils.extend({},e,{
                                        responseXML:h
                                    })
                                    }
                                }else{
                            h=new ActiveXObject("Microsoft.XMLDOM");
                            h.async="false";
                            h.loadXML(e.responseText);
                            e=b.utils.extend({},e,{
                                responseXML:h
                            })
                            }
                        }catch(j){
                    if(c){
                        c(g)
                        }
                    }
            }
        f(e)
    }
}else{
    if(c){
        c(g)
        }
    }
}
};

try{
    e.open("GET",g,true);
    e.send(null)
    }catch(d){
    if(c){
        c(g)
        }
    }
return e
};

b.utils.load=function(d,e,c){
    d.onreadystatechange=function(){
        if(d.readyState===4){
            if(d.status===200){
                if(e){
                    e()
                    }
                }else{
            if(c){
                c()
                }
            }
    }
}
};

b.utils.find=function(d,c){
    return d.getElementsByTagName(c)
    };
    
b.utils.append=function(c,d){
    c.appendChild(d)
    };
    ///Check browser//////////////////////////////////////////////////////////////////////////////////
b.utils.isIE=function(){
    return((!+"\v1")||(typeof window.ActiveXObject!="undefined"))
    };
    
b.utils.userAgentMatch=function(d){
    var c=navigator.userAgent.toLowerCase();
    return(c.match(d)!==null)
    };
    
b.utils.isIOS=function(){
    return b.utils.userAgentMatch(/iP(hone|ad|od)/i)
    };
    
b.utils.isIPad=function(){
    return b.utils.userAgentMatch(/iPad/i)
    };
    
b.utils.isIPod=function(){
    return b.utils.userAgentMatch(/iP(hone|od)/i)
    };
    
b.utils.isAndroid=function(){
    return b.utils.userAgentMatch(/android/i)
    };
    
b.utils.isLegacyAndroid=function(){
    return b.utils.userAgentMatch(/android 2.[012]/i)
    };
    
b.utils.isBlackberry=function(){
    return b.utils.userAgentMatch(/blackberry/i)
    };
    
b.utils.isMobile=function(){
    return b.utils.isIOS()
    };
    //playlist file xml.////////////////////////////////////////////////////////////////////////////
b.utils.getFirstPlaylistItemFromConfig=function(c){
    var d={};
    
    var e;
    if(c.playlist&&c.playlist.length){
        e=c.playlist[0]
        }else{
        e=c
        }
        d.file=e.file;
    d.levels=e.levels;
    d.streamer=e.streamer;
    d.playlistfile=e.playlistfile;
    d.provider=e.provider;
    if(!d.provider){
        if(d.file&&(d.file.toLowerCase().indexOf("youtube.com")>-1||d.file.toLowerCase().indexOf("youtu.be")>-1)){
            d.provider="youtube"
            }
            if(d.streamer&&d.streamer.toLowerCase().indexOf("rtmp://")==0){
            d.provider="rtmp"
            }
            if(e.type){
            d.provider=e.type.toLowerCase()
            }
        }
    if(d.provider=="audio"){
    d.provider="sound"
    }
    return d
};

b.utils.getOuterHTML=function(c){
    if(c.outerHTML){
        return c.outerHTML
        }else{
        try{
            return new XMLSerializer().serializeToString(c)
            }
            catch(d){
            return""
            }
        }
};

b.utils.setOuterHTML=function(f,e){
    if(f.outerHTML){
        f.outerHTML=e
        }else{
        var g=document.createElement("div");
        g.innerHTML=e;
        var c=document.createRange();
        c.selectNodeContents(g);
        var d=c.extractContents();
        f.parentNode.insertBefore(d,f);
        f.parentNode.removeChild(f)
        }
    };

b.utils.hasFlash=function(){
    if(typeof navigator.plugins!="undefined"&&typeof navigator.plugins["Shockwave Flash"]!="undefined"){
        return true
        }
        if(typeof window.ActiveXObject!="undefined"){
        try{
            new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
            return true
            }catch(c){}
    }
    return false
};
///get plugin name;////////////////////////////
b.utils.getPluginName=function(c){
    if(c.lastIndexOf("/")>=0){
        c=c.substring(c.lastIndexOf("/")+1,c.length)
        }
        if(c.lastIndexOf("-")>=0){
        c=c.substring(0,c.lastIndexOf("-"))
        }
        if(c.lastIndexOf(".swf")>=0){
        c=c.substring(0,c.lastIndexOf(".swf"))
        }
        if(c.lastIndexOf(".js")>=0){
        c=c.substring(0,c.lastIndexOf(".js"))
        }
        return c
    };
//get plugin version   ///////////////////////////////////// 
b.utils.getPluginVersion=function(c){
    if(c.lastIndexOf("-")>=0){
        if(c.lastIndexOf(".js")>=0){
            return c.substring(c.lastIndexOf("-")+1,c.lastIndexOf(".js"))
            }else{
            if(c.lastIndexOf(".swf")>=0){
                return c.substring(c.lastIndexOf("-")+1,c.lastIndexOf(".swf"))
                }else{
                return c.substring(c.lastIndexOf("-")+1)
                }
            }
    }
return""
};

b.utils.getAbsolutePath=function(j,h){
    if(!b.utils.exists(h)){
        h=document.location.href
        }
        if(!b.utils.exists(j)){
        return undefined
        }
        if(a(j)){
        return j
        }
        var k=h.substring(0,h.indexOf("://")+3);
    var g=h.substring(k.length,h.indexOf("/",k.length+1));
    var d;
    if(j.indexOf("/")===0){
        d=j.split("/")
        }else{
        var e=h.split("?")[0];
        e=e.substring(k.length+g.length+1,e.lastIndexOf("/"));
        d=e.split("/").concat(j.split("/"))
        }
        var c=[];
    for(var f=0;f<d.length;f++){
        if(!d[f]||!b.utils.exists(d[f])||d[f]=="."){
            continue
        }else{
            if(d[f]==".."){
                c.pop()
                }else{
                c.push(d[f])
                }
            }
    }
    return k+g+"/"+c.join("/")
};

function a(d){
    if(!b.utils.exists(d)){
        return
    }
    var e=d.indexOf("://");
    var c=d.indexOf("?");
    return(e>0&&(c<0||(c>e)))
    }
    b.utils.pluginPathType={
    ABSOLUTE:"ABSOLUTE",
    RELATIVE:"RELATIVE",
    CDN:"CDN"
};

b.utils.getPluginPathType=function(d){
    if(typeof d!="string"){
        return
    }
    d=d.split("?")[0];
    var e=d.indexOf("://");
    if(e>0){
        return b.utils.pluginPathType.ABSOLUTE
        }
        var c=d.indexOf("/");
    var f=b.utils.extension(d);
    if(e<0&&c<0&&(!f||!isNaN(f))){
        return b.utils.pluginPathType.CDN
        }
        return b.utils.pluginPathType.RELATIVE
    };
    
b.utils.mapEmpty=function(c){
    for(var d in c){
        return false
        }
        return true
    };
    
b.utils.mapLength=function(d){
    var c=0;
    for(var e in d){
        c++
    }
    return c
    };
    
b.utils.log=function(d,c){
    if(typeof console!="undefined"&&typeof console.log!="undefined"){
        if(c){
            console.log(d,c)
            }else{
            console.log(d)
            }
        }
};
//config css//////////////////////////////////////////////////////////////
b.utils.css=function(d,g,c){
    if(b.utils.exists(d)){
        for(var e in g){
            try{
                if(typeof g[e]==="undefined"){
                    continue
                }else{
                    if(typeof g[e]=="number"&&!(e=="zIndex"||e=="opacity")){
                        if(isNaN(g[e])){
                            continue
                        }
                        if(e.match(/color/i)){
                            g[e]="#"+b.utils.strings.pad(g[e].toString(16),6)
                            }else{
                            g[e]=Math.ceil(g[e])+"px"
                            }
                        }
                }
            d.style[e]=g[e]
        }catch(f){}
        }
    }
};

b.utils.isYouTube=function(c){
    return(c.indexOf("youtube.com")>-1||c.indexOf("youtu.be")>-1)
    };
    
b.utils.transform=function(e,d,c,g,h){
    if(!b.utils.exists(d)){
        d=1
        }
        if(!b.utils.exists(c)){
        c=1
        }
        if(!b.utils.exists(g)){
        g=0
        }
        if(!b.utils.exists(h)){
        h=0
        }
        if(d==1&&c==1&&g==0&&h==0){
        e.style.webkitTransform="";
        e.style.MozTransform="";
        e.style.OTransform=""
        }else{
        var f="scale("+d+","+c+") translate("+g+"px,"+h+"px)";
        e.style.webkitTransform=f;
        e.style.MozTransform=f;
        e.style.OTransform=f
        }
    };
///Config stretch//////////////////////////////////////////////////////////////
b.utils.stretch=function(j,p,o,f,m,g){
    if(typeof o=="undefined"||typeof f=="undefined"||typeof m=="undefined"||typeof g=="undefined"){
        return
    }
    var d=o/m;
    var e=f/g;
    var l=0;
    var k=0;
    var c={};
    
    if(p.parentElement){
        p.parentElement.style.overflow="hidden"
        }
        b.utils.transform(p);
    switch(j.toUpperCase()){
        case b.utils.stretching.NONE:
            c.width=m;
            c.height=g;
            c.top=(f-c.height)/2;
            c.left=(o-c.width)/2;
            break;
        case b.utils.stretching.UNIFORM://default;
            if(d>e){
            c.width=m*e;
            c.height=g*e
            }else{
            c.width=m*d;
            c.height=g*d
            }
            c.top=(f-c.height)/2;
            c.left=(o-c.width)/2;
            break;
        case b.utils.stretching.FILL:
            if(d>e){
            c.width=m*d;
            c.height=g*d
            }else{
            c.width=m*e;
            c.height=g*e
            }
            c.top=(f-c.height)/2;
            c.left=(o-c.width)/2;
            break;
        case b.utils.stretching.EXACTFIT:
            c.width=m;
            c.height=g;
            var n=Math.round((m/2)*(1-1/d));
            var h=Math.round((g/2)*(1-1/e));
            b.utils.transform(p,d,e,n,h);
            c.top=c.left=0;
            break;
        default:
            break
            }
            b.utils.css(p,c)
    };
    
b.utils.stretching={
    NONE:"NONE",
    FILL:"FILL",
    UNIFORM:"UNIFORM",
    EXACTFIT:"EXACTFIT"
};

b.utils.deepReplaceKeyName=function(h,e,c){
    switch(b.utils.typeOf(h)){
        case"array":
            for(var g=0;g<h.length;g++){
            h[g]=b.utils.deepReplaceKeyName(h[g],e,c)
            }
            break;
        case"object":
            for(var f in h){
            var d=f.replace(new RegExp(e,"g"),c);
            h[d]=b.utils.deepReplaceKeyName(h[f],e,c);
            if(f!=d){
                delete h[f]
            }
        }
        break
        }
        return h
};

b.utils.isInArray=function(e,d){
    if(!(e)||!(e instanceof Array)){
        return false
        }
        for(var c=0;c<e.length;c++){
        if(d===e[c]){
            return true
            }
        }
    return false
};

b.utils.exists=function(c){
    switch(typeof(c)){
        case"string":
            return(c.length>0);
            break;
        case"object":
            return(c!==null);
        case"undefined":
            return false
            }
            return true
    };
    
b.utils.empty=function(c){
    if(typeof c.hasChildNodes=="function"){
        while(c.hasChildNodes()){
            c.removeChild(c.firstChild)
            }
        }
};

b.utils.parseDimension=function(c){
    if(typeof c=="string"){
        if(c===""){
            return 0
            }else{
            if(c.lastIndexOf("%")>-1){
                return c
                }else{
                return parseInt(c.replace("px",""),10)
                }
            }
    }
return c
};

b.utils.getDimensions=function(c){
    if(c&&c.style){
        return{
            x:b.utils.parseDimension(c.style.left),
            y:b.utils.parseDimension(c.style.top),
            width:b.utils.parseDimension(c.style.width),
            height:b.utils.parseDimension(c.style.height)
            }
        }else{
    return{}
}
};
//get width of the player/////////////////////
b.utils.getElementWidth=function(c){
    if(!c){
        return null
        }else{
        if(c==document.body){
            return b.utils.parentNode(c).clientWidth
            }else{
            if(c.clientWidth>0){
                return c.clientWidth
                }else{
                if(c.style){
                    return b.utils.parseDimension(c.style.width)
                    }else{
                    return null
                    }
                }
        }
}
};
//get height of the player/////////////////////
b.utils.getElementHeight=function(c){
    if(!c){
        return null
        }else{
        if(c==document.body){
            return b.utils.parentNode(c).clientHeight
            }else{
            if(c.clientHeight>0){
                return c.clientHeight
                }else{
                if(c.style){
                    return b.utils.parseDimension(c.style.height)
                    }else{
                    return null
                    }
                }
        }
}
};

b.utils.timeFormat=function(c){
    str="00:00";
    if(c>0){
        str=Math.floor(c/60)<10?"0"+Math.floor(c/60)+":":Math.floor(c/60)+":";
        str+=Math.floor(c%60)<10?"0"+Math.floor(c%60):Math.floor(c%60)
        }
        return str
    };
    
b.utils.useNativeFullscreen=function(){
    return(navigator&&navigator.vendor&&navigator.vendor.indexOf("Apple")==0)
    };
    
b.utils.parentNode=function(c){
    if(!c){
        return docuemnt.body
        }else{
        if(c.parentNode){
            return c.parentNode
            }else{
            if(c.parentElement){
                return c.parentElement
                }else{
                return c
                }
            }
    }
};

b.utils.getBoundingClientRect=function(c){
    if(typeof c.getBoundingClientRect=="function"){
        return c.getBoundingClientRect()
        }else{
        return{
            left:c.offsetLeft+document.body.scrollLeft,
            top:c.offsetTop+document.body.scrollTop,
            width:c.offsetWidth,
            height:c.offsetHeight
            }
        }
}
})(jwplayer);
(function(a){
    a.events=function(){};
    
    a.events.COMPLETE="COMPLETE";
    a.events.ERROR="ERROR"
    })(jwplayer);
(function(jwplayer){
    jwplayer.events.eventdispatcher=function(debug){
        var _debug=debug;
        var _listeners;
        var _globallisteners;
        this.resetEventListeners=function(){
            _listeners={};
            
            _globallisteners=[]
            };
            
        this.resetEventListeners();
        this.addEventListener=function(type,listener,count){
            try{
                if(!jwplayer.utils.exists(_listeners[type])){
                    _listeners[type]=[]
                    }
                    if(typeof(listener)=="string"){
                    eval("listener = "+listener)
                    }
                    _listeners[type].push({
                    listener:listener,
                    count:count
                })
                }catch(err){
                jwplayer.utils.log("error",err)
                }
                return false
            };
            
        this.removeEventListener=function(type,listener){
            if(!_listeners[type]){
                return
            }
            try{
                for(var listenerIndex=0;listenerIndex<_listeners[type].length;listenerIndex++){
                    if(_listeners[type][listenerIndex].listener.toString()==listener.toString()){
                        _listeners[type].splice(listenerIndex,1);
                        break
                    }
                }
                }catch(err){
        jwplayer.utils.log("error",err)
        }
        return false
    };
    
this.addGlobalListener=function(listener,count){
    try{
        if(typeof(listener)=="string"){
            eval("listener = "+listener)
            }
            _globallisteners.push({
            listener:listener,
            count:count
        })
        }catch(err){
        jwplayer.utils.log("error",err)
        }
        return false
    };
    
this.removeGlobalListener=function(listener){
    if(!_globallisteners[type]){
        return
    }
    try{
        for(var globalListenerIndex=0;globalListenerIndex<_globallisteners.length;globalListenerIndex++){
            if(_globallisteners[globalListenerIndex].listener.toString()==listener.toString()){
                _globallisteners.splice(globalListenerIndex,1);
                break
            }
        }
        }catch(err){
    jwplayer.utils.log("error",err)
    }
    return false
    };
    
this.sendEvent=function(type,data){
    if(!jwplayer.utils.exists(data)){
        data={}
    }
    if(_debug){
    jwplayer.utils.log(type,data)
    }
    if(typeof _listeners[type]!="undefined"){
    for(var listenerIndex=0;listenerIndex<_listeners[type].length;listenerIndex++){
        try{
            _listeners[type][listenerIndex].listener(data)
            }catch(err){
            jwplayer.utils.log("There was an error while handling a listener: "+err.toString(),_listeners[type][listenerIndex].listener)
            }
            if(_listeners[type][listenerIndex]){
            if(_listeners[type][listenerIndex].count===1){
                delete _listeners[type][listenerIndex]
            }else{
                if(_listeners[type][listenerIndex].count>0){
                    _listeners[type][listenerIndex].count=_listeners[type][listenerIndex].count-1
                    }
                }
        }
    }
}
for(var globalListenerIndex=0;globalListenerIndex<_globallisteners.length;globalListenerIndex++){
    try{
        _globallisteners[globalListenerIndex].listener(data)
        }catch(err){
        jwplayer.utils.log("There was an error while handling a listener: "+err.toString(),_globallisteners[globalListenerIndex].listener)
        }
        if(_globallisteners[globalListenerIndex]){
        if(_globallisteners[globalListenerIndex].count===1){
            delete _globallisteners[globalListenerIndex]
        }else{
            if(_globallisteners[globalListenerIndex].count>0){
                _globallisteners[globalListenerIndex].count=_globallisteners[globalListenerIndex].count-1
                }
            }
    }
}
}
}
})(jwplayer);
(function(a){
    var b={};
    
    a.utils.animations=function(){};
    
    a.utils.animations.transform=function(c,d){
        c.style.webkitTransform=d;
        c.style.MozTransform=d;
        c.style.OTransform=d;
        c.style.msTransform=d
        };
        
    a.utils.animations.transformOrigin=function(c,d){
        c.style.webkitTransformOrigin=d;
        c.style.MozTransformOrigin=d;
        c.style.OTransformOrigin=d;
        c.style.msTransformOrigin=d
        };
        
    a.utils.animations.rotate=function(c,d){
        a.utils.animations.transform(c,["rotate(",d,"deg)"].join(""))
        };
        
    a.utils.cancelAnimation=function(c){
        delete b[c.id]
    };
    
    a.utils.fadeTo=function(m,f,e,j,h,d){
        if(b[m.id]!=d&&a.utils.exists(d)){
            return
        }
        if(m.style.opacity==f){
            return
        }
        var c=new Date().getTime();
        if(d>c){
            setTimeout(function(){
                a.utils.fadeTo(m,f,e,j,0,d)
                },d-c)
            }
            if(m.style.display=="none"){
            m.style.display="block"
            }
            if(!a.utils.exists(j)){
            j=m.style.opacity===""?1:m.style.opacity
            }
            if(m.style.opacity==f&&m.style.opacity!==""&&a.utils.exists(d)){
            if(f===0){
                m.style.display="none"
                }
                return
        }
        if(!a.utils.exists(d)){
            d=c;
            b[m.id]=d
            }
            if(!a.utils.exists(h)){
            h=0
            }
            var k=(e>0)?((c-d)/(e*1000)):0;
        k=k>1?1:k;
        var l=f-j;
        var g=j+(k*l);
        if(g>1){
            g=1
            }else{
            if(g<0){
                g=0
                }
            }
        m.style.opacity=g;
    if(h>0){
        b[m.id]=d+h*1000;
        a.utils.fadeTo(m,f,e,j,0,b[m.id]);
        return
    }
    setTimeout(function(){
        a.utils.fadeTo(m,f,e,j,0,d)
        },10)
    }
})(jwplayer);
(function(a){
    a.utils.arrays=function(){};
    
    a.utils.arrays.indexOf=function(c,d){
        for(var b=0;b<c.length;b++){
            if(c[b]==d){
                return b
                }
            }
        return -1
    };
    
a.utils.arrays.remove=function(c,d){
    var b=a.utils.arrays.indexOf(c,d);
    if(b>-1){
        c.splice(b,1)
        }
    }
})(jwplayer);
(function(a){
    a.utils.extensionmap={
        "3gp":{
            html5:"video/3gpp",
            flash:"video"
        },
        "3gpp":{
            html5:"video/3gpp"
        },
        "3g2":{
            html5:"video/3gpp2",
            flash:"video"
        },
        "3gpp2":{
            html5:"video/3gpp2"
        },
        flv:{
            flash:"video"
        },
        f4a:{
            html5:"audio/mp4"
        },
        f4b:{
            html5:"audio/mp4",
            flash:"video"
        },
        f4v:{
            html5:"video/mp4",
            flash:"video"
        },
        mov:{
            html5:"video/quicktime",
            flash:"video"
        },
        m4a:{
            html5:"audio/mp4",
            flash:"video"
        },
        m4b:{
            html5:"audio/mp4"
        },
        m4p:{
            html5:"audio/mp4"
        },
        m4v:{
            html5:"video/mp4",
            flash:"video"
        },
        mp4:{
            html5:"video/mp4",
            flash:"video"
        },
        rbs:{
            flash:"sound"
        },
        aac:{
            html5:"audio/aac",
            flash:"video"
        },
        mp3:{
            html5:"audio/mp3",
            flash:"sound"
        },
        ogg:{
            html5:"audio/ogg"
        },
        oga:{
            html5:"audio/ogg"
        },
        ogv:{
            html5:"video/ogg"
        },
        webm:{
            html5:"video/webm"
        },
        m3u8:{
            html5:"audio/x-mpegurl"
        },
        gif:{
            flash:"image"
        },
        jpeg:{
            flash:"image"
        },
        jpg:{
            flash:"image"
        },
        swf:{
            flash:"image"
        },
        png:{
            flash:"image"
        },
        wav:{
            html5:"audio/x-wav"
        }
    }
})(jwplayer);
(function(e){
    e.utils.mediaparser=function(){};
    
    var g={
        element:{
            width:"width",
            height:"height",
            id:"id",
            "class":"className",
            name:"name"
        },
        media:{
            src:"file",
            preload:"preload",
            autoplay:"autostart",
            loop:"repeat",
            controls:"controls"
        },
        source:{
            src:"file",
            type:"type",
            media:"media",
            "data-jw-width":"width",
            "data-jw-bitrate":"bitrate"
        },
        video:{
            poster:"image"
        }
    };
    
var f={};

e.utils.mediaparser.parseMedia=function(j){
    return d(j)
    };
    
function c(k,j){
    if(!e.utils.exists(j)){
        j=g[k]
        }else{
        e.utils.extend(j,g[k])
        }
        return j
    }
    function d(n,j){
    if(f[n.tagName.toLowerCase()]&&!e.utils.exists(j)){
        return f[n.tagName.toLowerCase()](n)
        }else{
        j=c("element",j);
        var o={};
        
        for(var k in j){
            if(k!="length"){
                var m=n.getAttribute(k);
                if(e.utils.exists(m)){
                    o[j[k]]=m
                    }
                }
        }
        var l=n.style["#background-color"];
if(l&&!(l=="transparent"||l=="rgba(0, 0, 0, 0)")){
    o.screencolor=l
    }
    return o
}
}
function h(n,k){
    k=c("media",k);
    var l=[];
    var j=e.utils.selectors("source",n);
    for(var m in j){
        if(!isNaN(m)){
            l.push(a(j[m]))
            }
        }
    var o=d(n,k);
if(e.utils.exists(o.file)){
    l[0]={
        file:o.file
        }
    }
o.levels=l;
return o
}
function a(l,k){
    k=c("source",k);
    var j=d(l,k);
    j.width=j.width?j.width:0;
    j.bitrate=j.bitrate?j.bitrate:0;
    return j
    }
    function b(l,k){
    k=c("video",k);
    var j=h(l,k);
    return j
    }
    f.media=h;
f.audio=h;
f.source=a;
f.video=b
})(jwplayer);
(function(a){
    a.utils.loaderstatus={
        NEW:"NEW",
        LOADING:"LOADING",
        ERROR:"ERROR",
        COMPLETE:"COMPLETE"
    };
    
    a.utils.scriptloader=function(c){
        var d=a.utils.loaderstatus.NEW;
        var b=new a.events.eventdispatcher();
        a.utils.extend(this,b);
        this.load=function(){
            if(d==a.utils.loaderstatus.NEW){
                d=a.utils.loaderstatus.LOADING;
                var e=document.createElement("script");
                e.onload=function(f){
                    d=a.utils.loaderstatus.COMPLETE;
                    b.sendEvent(a.events.COMPLETE)
                    };
                    
                e.onerror=function(f){
                    d=a.utils.loaderstatus.ERROR;
                    b.sendEvent(a.events.ERROR)
                    };
                    
                e.onreadystatechange=function(){
                    if(e.readyState=="loaded"||e.readyState=="complete"){
                        d=a.utils.loaderstatus.COMPLETE;
                        b.sendEvent(a.events.COMPLETE)
                        }
                    };
                
            document.getElementsByTagName("head")[0].appendChild(e);
            e.src=c
            }
        };
    
this.getStatus=function(){
    return d
    }
}
})(jwplayer);
(function(a){
    a.utils.selectors=function(b,e){
        if(!a.utils.exists(e)){
            e=document
            }
            b=a.utils.strings.trim(b);
        var c=b.charAt(0);
        if(c=="#"){
            return e.getElementById(b.substr(1))
            }else{
            if(c=="."){
                if(e.getElementsByClassName){
                    return e.getElementsByClassName(b.substr(1))
                    }else{
                    return a.utils.selectors.getElementsByTagAndClass("*",b.substr(1))
                    }
                }else{
            if(b.indexOf(".")>0){
                var d=b.split(".");
                return a.utils.selectors.getElementsByTagAndClass(d[0],d[1])
                }else{
                return e.getElementsByTagName(b)
                }
            }
    }
return null
};

a.utils.selectors.getElementsByTagAndClass=function(e,h,g){
    var j=[];
    if(!a.utils.exists(g)){
        g=document
        }
        var f=g.getElementsByTagName(e);
    for(var d=0;d<f.length;d++){
        if(a.utils.exists(f[d].className)){
            var c=f[d].className.split(" ");
            for(var b=0;b<c.length;b++){
                if(c[b]==h){
                    j.push(f[d])
                    }
                }
            }
    }
return j
}
})(jwplayer);
(function(a){
    a.utils.strings=function(){};
    
    a.utils.strings.trim=function(b){
        return b.replace(/^\s*/,"").replace(/\s*$/,"")
        };
        
    a.utils.strings.pad=function(c,d,b){
        if(!b){
            b="0"
            }while(c.length<d){
            c=b+c
            }
            return c
        };
        
    a.utils.strings.serialize=function(b){
        if(b==null){
            return null
            }else{
            if(b=="true"){
                return true
                }else{
                if(b=="false"){
                    return false
                    }else{
                    if(isNaN(Number(b))||b.length>5||b.length==0){
                        return b
                        }else{
                        return Number(b)
                        }
                    }
            }
    }
};
///Calculate time of file///////////////////////////////////
a.utils.strings.seconds=function(d){
    d=d.replace(",",".");
    var b=d.split(":");
    var c=0;
    if(d.substr(-1)=="s"){
        c=Number(d.substr(0,d.length-1))
        }else{
        if(d.substr(-1)=="m"){
            c=Number(d.substr(0,d.length-1))*60
            }else{
            if(d.substr(-1)=="h"){
                c=Number(d.substr(0,d.length-1))*3600
                }else{
                if(b.length>1){
                    c=Number(b[b.length-1]);
                    c+=Number(b[b.length-2])*60;
                    if(b.length==3){
                        c+=Number(b[b.length-3])*3600
                        }
                    }else{
                c=Number(d)
                }
            }
    }
}
return c
};

a.utils.strings.xmlAttribute=function(b,c){
    for(var d=0;d<b.attributes.length;d++){
        if(b.attributes[d].name&&b.attributes[d].name.toLowerCase()==c.toLowerCase()){
            return b.attributes[d].value.toString()
            }
        }
    return""
};

a.utils.strings.jsonToString=function(f){
    var h=h||{};
    
    if(h&&h.stringify){
        return h.stringify(f)
        }
        var c=typeof(f);
    if(c!="object"||f===null){
        if(c=="string"){
            f='"'+f.replace(/"/g,'\\"')+'"'
            }else{
            return String(f)
            }
        }else{
    var g=[],b=(f&&f.constructor==Array);
    for(var d in f){
        var e=f[d];
        switch(typeof(e)){
            case"string":
                e='"'+e.replace(/"/g,'\\"')+'"';
                break;
            case"object":
                if(a.utils.exists(e)){
                e=a.utils.strings.jsonToString(e)
                }
                break
            }
            if(b){
            if(typeof(e)!="function"){
                g.push(String(e))
                }
            }else{
        if(typeof(e)!="function"){
            g.push('"'+d+'":'+String(e))
            }
        }
    }
    if(b){
    return"["+String(g)+"]"
    }else{
    return"{"+String(g)+"}"
    }
}
}
})(jwplayer);
(function(c){
    var d=new RegExp(/^(#|0x)[0-9a-fA-F]{3,6}/);
    c.utils.typechecker=function(g,f){
        f=!c.utils.exists(f)?b(g):f;
        return e(g,f)
        };
        
    function b(f){
        var g=["true","false","t","f"];
        if(g.toString().indexOf(f.toLowerCase().replace(" ",""))>=0){
            return"boolean"
            }else{
            if(d.test(f)){
                return"color"
                }else{
                if(!isNaN(parseInt(f,10))&&parseInt(f,10).toString().length==f.length){
                    return"integer"
                    }else{
                    if(!isNaN(parseFloat(f))&&parseFloat(f).toString().length==f.length){
                        return"float"
                        }
                    }
            }
    }
return"string"
}
function e(g,f){
    if(!c.utils.exists(f)){
        return g
        }
        switch(f){
        case"color":
            if(g.length>0){
            return a(g)
            }
            return null;
        case"integer":
            return parseInt(g,10);
        case"float":
            return parseFloat(g);
        case"boolean":
            if(g.toLowerCase()=="true"){
            return true
            }else{
            if(g=="1"){
                return true
                }
            }
        return false
        }
        return g
}
function a(f){
    switch(f.toLowerCase()){
        case"blue":
            return parseInt("0000FF",16);
        case"green":
            return parseInt("00FF00",16);
        case"red":
            return parseInt("FF0000",16);
        case"cyan":
            return parseInt("00FFFF",16);
        case"magenta":
            return parseInt("FF00FF",16);
        case"yellow":
            return parseInt("FFFF00",16);
        case"black":
            return parseInt("000000",16);
        case"white":
            return parseInt("FFFFFF",16);
        default:
            f=f.replace(/(#|0x)?([0-9A-F]{3,6})$/gi,"$2");
            if(f.length==3){
            f=f.charAt(0)+f.charAt(0)+f.charAt(1)+f.charAt(1)+f.charAt(2)+f.charAt(2)
            }
            return parseInt(f,16)
            }
            return parseInt("000000",16)
    }
})(jwplayer);
(function(a){
    a.utils.parsers=function(){};
    
    a.utils.parsers.localName=function(b){
        if(!b){
            return""
            }else{
            if(b.localName){
                return b.localName
                }
                else{
                if(b.baseName){
                    return b.baseName
                    }
                    else{
                    return""
                    }
                }
        }
};

a.utils.parsers.textContent=function(b){
    if(!b){
        return""
        }else{
        if(b.textContent){
            return b.textContent
            }else{
            if(b.text){
                return b.text
                }else{
                return""
                }
            }
    }
}
})(jwplayer);
(function(a){
    a.utils.parsers.jwparser=function(){};
    
    a.utils.parsers.jwparser.PREFIX="jwplayer";
    a.utils.parsers.jwparser.parseEntry=function(c,d){
        for(var b=0;b<c.childNodes.length;b++){
            if(c.childNodes[b].prefix==a.utils.parsers.jwparser.PREFIX){
                d[a.utils.parsers.localName(c.childNodes[b])]=a.utils.strings.serialize(a.utils.parsers.textContent(c.childNodes[b]))
                }
                if(!d.file&&String(d.link).toLowerCase().indexOf("youtube")>-1){
                d.file=d.link
                }
            }
        return d
    };
    
a.utils.parsers.jwparser.getProvider=function(c){
    if(c.type){
        return c.type
        }else{
        if(c.file.indexOf("youtube.com/w")>-1||c.file.indexOf("youtube.com/v")>-1||c.file.indexOf("youtu.be/")>-1){
            return"youtube"
            }else{
            if(c.streamer&&c.streamer.indexOf("rtmp")==0){
                return"rtmp"
                }else{
                if(c.streamer&&c.streamer.indexOf("http")==0){
                    return"http"
                    }else{
                    var b=a.utils.strings.extension(c.file);
                    if(extensions.hasOwnProperty(b)){
                        return extensions[b]
                        }
                    }
            }
    }
}
return""
}
})(jwplayer);
(function(a){
    a.utils.parsers.mediaparser=function(){};
    
    a.utils.parsers.mediaparser.PREFIX="media";
    a.utils.parsers.mediaparser.parseGroup=function(d,f){
        var e=false;
        for(var c=0;c<d.childNodes.length;c++){
            if(d.childNodes[c].prefix==a.utils.parsers.mediaparser.PREFIX){
                if(!a.utils.parsers.localName(d.childNodes[c])){
                    continue
                }
                switch(a.utils.parsers.localName(d.childNodes[c]).toLowerCase()){
                    case"content":
                        if(!e){
                        f.file=a.utils.strings.xmlAttribute(d.childNodes[c],"url")
                        }
                        if(a.utils.strings.xmlAttribute(d.childNodes[c],"duration")){
                        f.duration=a.utils.strings.seconds(a.utils.strings.xmlAttribute(d.childNodes[c],"duration"))
                        }
                        if(a.utils.strings.xmlAttribute(d.childNodes[c],"start")){
                        f.start=a.utils.strings.seconds(a.utils.strings.xmlAttribute(d.childNodes[c],"start"))
                        }
                        if(d.childNodes[c].childNodes&&d.childNodes[c].childNodes.length>0){
                        f=a.utils.parsers.mediaparser.parseGroup(d.childNodes[c],f)
                        }
                        if(a.utils.strings.xmlAttribute(d.childNodes[c],"width")||a.utils.strings.xmlAttribute(d.childNodes[c],"bitrate")||a.utils.strings.xmlAttribute(d.childNodes[c],"url")){
                        if(!f.levels){
                            f.levels=[]
                            }
                            f.levels.push({
                            width:a.utils.strings.xmlAttribute(d.childNodes[c],"width"),
                            bitrate:a.utils.strings.xmlAttribute(d.childNodes[c],"bitrate"),
                            file:a.utils.strings.xmlAttribute(d.childNodes[c],"url")
                            })
                        }
                        break;
                    case"title":
                        f.title=a.utils.parsers.textContent(d.childNodes[c]);
                        break;
                    case"description":
                        f.description=a.utils.parsers.textContent(d.childNodes[c]);
                        break;
                    case"keywords":
                        f.tags=a.utils.parsers.textContent(d.childNodes[c]);
                        break;
                    case"thumbnail":
                        f.image=a.utils.strings.xmlAttribute(d.childNodes[c],"url");
                        break;
                    case"credit":
                        f.author=a.utils.parsers.textContent(d.childNodes[c]);
                        break;
                    case"player":
                        var b=d.childNodes[c].url;
                        if(b.indexOf("youtube.com")>=0||b.indexOf("youtu.be")>=0){
                        e=true;
                        f.file=a.utils.strings.xmlAttribute(d.childNodes[c],"url")
                        }
                        break;
                    case"group":
                        a.utils.parsers.mediaparser.parseGroup(d.childNodes[c],f);
                        break
                        }
                    }
        }
        return f
}
})(jwplayer);
(function(b){
    b.utils.parsers.rssparser=function(){};
    
    b.utils.parsers.rssparser.parse=function(f){
        var c=[];
        for(var e=0;e<f.childNodes.length;e++){
            if(b.utils.parsers.localName(f.childNodes[e]).toLowerCase()=="channel"){
                for(var d=0;d<f.childNodes[e].childNodes.length;d++){
                    if(b.utils.parsers.localName(f.childNodes[e].childNodes[d]).toLowerCase()=="item"){
                        c.push(a(f.childNodes[e].childNodes[d]))
                        }
                    }
                }
        }
    return c
};

function a(d){
    var e={};
    
    for(var c=0;c<d.childNodes.length;c++){
        if(!b.utils.parsers.localName(d.childNodes[c])){
            continue
        }
        switch(b.utils.parsers.localName(d.childNodes[c]).toLowerCase()){
            case"enclosure":
                e.file=b.utils.strings.xmlAttribute(d.childNodes[c],"url");
                break;
            case"title":
                e.title=b.utils.parsers.textContent(d.childNodes[c]);
                break;
            case"pubdate":
                e.date=b.utils.parsers.textContent(d.childNodes[c]);
                break;
            case"description":
                e.description=b.utils.parsers.textContent(d.childNodes[c]);
                break;
            case"link":
                e.link=b.utils.parsers.textContent(d.childNodes[c]);
                break;
            case"category":
                if(e.tags){
                e.tags+=b.utils.parsers.textContent(d.childNodes[c])
                }else{
                e.tags=b.utils.parsers.textContent(d.childNodes[c])
                }
                break
            }
            }
    e=b.utils.parsers.mediaparser.parseGroup(d,e);
e=b.utils.parsers.jwparser.parseEntry(d,e);
return new b.html5.playlistitem(e)
}
})(jwplayer);
(function(a){
    var c={};
    
    var b={};
    
    a.plugins=function(){};
    
    a.plugins.loadPlugins=function(e,d){
        b[e]=new a.plugins.pluginloader(new a.plugins.model(c),d);
        return b[e]
        };
        
    a.plugins.registerPlugin=function(h,f,e){
        var d=a.utils.getPluginName(h);
        if(c[d]){
            c[d].registerPlugin(h,f,e)
            }else{
            a.utils.log("A plugin ("+h+") was registered with the player that was not loaded. Please check your configuration.");
            for(var g in b){
                b[g].pluginFailed()
                }
            }
            }
})(jwplayer);
(function(a){
    a.plugins.model=function(b){
        this.addPlugin=function(c){
            var d=a.utils.getPluginName(c);
            if(!b[d]){
                b[d]=new a.plugins.plugin(c)
                }
                return b[d]
            }
        }
})(jwplayer);
(function(a){
    a.plugins.pluginmodes={
        FLASH:"FLASH",
        JAVASCRIPT:"JAVASCRIPT",
        HYBRID:"HYBRID"
    };
    ///Load plugin from longtailvideo.com////////////////////
    a.plugins.plugin=function(b){
        var d="http://plugins.longtailvideo.com";
        var j=a.utils.loaderstatus.NEW;
        var k;
        var h;
        var l;
        var c=new a.events.eventdispatcher();
        a.utils.extend(this,c);
        function e(){
            switch(a.utils.getPluginPathType(b)){
                case a.utils.pluginPathType.ABSOLUTE:
                    return b;
                case a.utils.pluginPathType.RELATIVE:
                    return a.utils.getAbsolutePath(b,window.location.href);
                case a.utils.pluginPathType.CDN:
                    var o=a.utils.getPluginName(b);
                    var n=a.utils.getPluginVersion(b);
                    var m=(window.location.href.indexOf("https://")==0)?d.replace("http://","https://secure"):d;
                    return m+"/"+a.version.split(".")[0]+"/"+o+"/"+o+(n!==""?("-"+n):"")+".js"
                    }
                }
        function g(m){
        l=setTimeout(function(){
            j=a.utils.loaderstatus.COMPLETE;
            c.sendEvent(a.events.COMPLETE)
            },1000)
        }
        function f(m){
        j=a.utils.loaderstatus.ERROR;
        c.sendEvent(a.events.ERROR)
        }
        this.load=function(){
        if(j==a.utils.loaderstatus.NEW){
            if(b.lastIndexOf(".swf")>0){
                k=b;
                j=a.utils.loaderstatus.COMPLETE;
                c.sendEvent(a.events.COMPLETE);
                return
            }
            j=a.utils.loaderstatus.LOADING;
            var m=new a.utils.scriptloader(e());
            m.addEventListener(a.events.COMPLETE,g);
            m.addEventListener(a.events.ERROR,f);
            m.load()
            }
        };
///properties./////////////////////////////    
this.registerPlugin=function(o,n,m){
    if(l){
        clearTimeout(l);
        l=undefined
        }
        if(n&&m){
        k=m;
        h=n
        }else{
        if(typeof n=="string"){
            k=n
            }else{
            if(typeof n=="function"){
                h=n
                }else{
                if(!n&&!m){
                    k=o
                    }
                }
        }
}
j=a.utils.loaderstatus.COMPLETE;
c.sendEvent(a.events.COMPLETE)
};

this.getStatus=function(){
    return j
    };
    
this.getPluginName=function(){
    return a.utils.getPluginName(b)
    };
    
this.getFlashPath=function(){
    if(k){
        switch(a.utils.getPluginPathType(k)){
            case a.utils.pluginPathType.ABSOLUTE:
                return k;
            case a.utils.pluginPathType.RELATIVE:
                if(b.lastIndexOf(".swf")>0){
                return a.utils.getAbsolutePath(k,window.location.href)
                }
                return a.utils.getAbsolutePath(k,e());
            case a.utils.pluginPathType.CDN:
                if(k.indexOf("-")>-1){
                return k+"h"
                }
                return k+"-h"
            }
            }
    return null
};

this.getJS=function(){
    return h
    };
    
this.getPluginmode=function(){
    if(typeof k!="undefined"&&typeof h!="undefined"){
        return a.plugins.pluginmodes.HYBRID
        }else{
        if(typeof k!="undefined"){
            return a.plugins.pluginmodes.FLASH
            }else{
            if(typeof h!="undefined"){
                return a.plugins.pluginmodes.JAVASCRIPT
                }
            }
    }
};

this.getNewInstance=function(n,m,o){
    return new h(n,m,o)
    };
    
this.getURL=function(){
    return b
    }
}
})(jwplayer);
(function(a){
    a.plugins.pluginloader=function(h,e){
        var g={};
        
        var k=a.utils.loaderstatus.NEW;
        var d=false;
        var b=false;
        var c=new a.events.eventdispatcher();
        a.utils.extend(this,c);
        function f(){
            if(!b){
                b=true;
                k=a.utils.loaderstatus.COMPLETE;
                c.sendEvent(a.events.COMPLETE)
                }
            }
        function j(){
        if(!b){
            var m=0;
            for(plugin in g){
                var l=g[plugin].getStatus();
                if(l==a.utils.loaderstatus.LOADING||l==a.utils.loaderstatus.NEW){
                    m++
                }
            }
            if(m==0){
            f()
            }
        }
}
this.setupPlugins=function(n,l,s){
    var m={
        length:0,
        plugins:{}
};

var p={
    length:0,
    plugins:{}
};

for(var o in g){
    var q=g[o].getPluginName();
    if(g[o].getFlashPath()){
        m.plugins[g[o].getFlashPath()]=l.plugins[o];
        m.plugins[g[o].getFlashPath()].pluginmode=g[o].getPluginmode();
        m.length++
    }
    if(g[o].getJS()){
        var r=document.createElement("div");
        r.id=n.id+"_"+q;
        r.style.position="absolute";
        r.style.zIndex=p.length+10;
        p.plugins[q]=g[o].getNewInstance(n,l.plugins[o],r);
        p.length++;
        if(typeof p.plugins[q].resize!="undefined"){
            n.onReady(s(p.plugins[q],r,true));
            n.onResize(s(p.plugins[q],r))
            }
        }
}
n.plugins=p.plugins;
return m
};

this.load=function(){
    k=a.utils.loaderstatus.LOADING;
    d=true;
    for(var l in e){
        if(a.utils.exists(l)){
            g[l]=h.addPlugin(l);
            g[l].addEventListener(a.events.COMPLETE,j);
            g[l].addEventListener(a.events.ERROR,j)
            }
        }
    for(l in g){
    g[l].load()
    }
    d=false;
j()
};

this.pluginFailed=function(){
    f()
    };
    
this.getStatus=function(){
    return k
    }
}
})(jwplayer);
(function(b){
    var a=[];
    b.api=function(d){
        this.container=d;
        this.id=d.id;
        var n={};
        
        var s={};
        
        var q={};
        
        var c=[];
        var h=undefined;
        var l=false;
        var j=[];
        var p=b.utils.getOuterHTML(d);
        var r={};
        
        var k={};
        
        this.getBuffer=function(){
            return this.callInternal("jwGetBuffer")
            };
            
        this.getContainer=function(){
            return this.container
            };
            
        function e(u,t){
            return function(z,v,w,x){
                if(u.renderingMode=="flash"||u.renderingMode=="html5"){
                    var y;
                    if(v){
                        k[z]=v;
                        y="jwplayer('"+u.id+"').callback('"+z+"')"
                        }else{
                        if(!v&&k[z]){
                            delete k[z]
                        }
                    }
                    h.jwDockSetButton(z,y,w,x)
                }
                return t
            }
        }
    this.getPlugin=function(t){
    var v=this;
    var u={};
    
    if(t=="dock"){
        return b.utils.extend(u,{
            setButton:e(v,u),
            show:function(){
                v.callInternal("jwDockShow");
                return u
                },
            hide:function(){
                v.callInternal("jwDockHide");
                return u
                },
            onShow:function(w){
                v.componentListener("dock",b.api.events.JWPLAYER_COMPONENT_SHOW,w);
                return u
                },
            onHide:function(w){
                v.componentListener("dock",b.api.events.JWPLAYER_COMPONENT_HIDE,w);
                return u
                }
            })
    }else{
    if(t=="controlbar"){
        return b.utils.extend(u,{
            show:function(){
                v.callInternal("jwControlbarShow");
                return u
                },
            hide:function(){
                v.callInternal("jwControlbarHide");
                return u
                },
            onShow:function(w){
                v.componentListener("controlbar",b.api.events.JWPLAYER_COMPONENT_SHOW,w);
                return u
                },
            onHide:function(w){
                v.componentListener("controlbar",b.api.events.JWPLAYER_COMPONENT_HIDE,w);
                return u
                }
            })
    }else{
    if(t=="display"){
        return b.utils.extend(u,{
            show:function(){
                v.callInternal("jwDisplayShow");
                return u
                },
            hide:function(){
                v.callInternal("jwDisplayHide");
                return u
                },
            onShow:function(w){
                v.componentListener("display",b.api.events.JWPLAYER_COMPONENT_SHOW,w);
                return u
                },
            onHide:function(w){
                v.componentListener("display",b.api.events.JWPLAYER_COMPONENT_HIDE,w);
                return u
                }
            })
    }else{
    return this.plugins[t]
    }
}
}
};
////Method and properties/////////////////////////////////////////////////////////
this.callback=function(t){
    if(k[t]){
        return k[t]()
        }
    };

this.getDuration=function(){
    return this.callInternal("jwGetDuration")
    };
    
this.getFullscreen=function(){
    return this.callInternal("jwGetFullscreen")
    };
    
this.getHeight=function(){
    return this.callInternal("jwGetHeight")
    };
    
this.getLockState=function(){
    return this.callInternal("jwGetLockState")
    };
    
this.getMeta=function(){
    return this.getItemMeta()
    };
    
this.getMute=function(){
    return this.callInternal("jwGetMute")
    };
    
this.getPlaylist=function(){
    var u=this.callInternal("jwGetPlaylist");
    if(this.renderingMode=="flash"){
        b.utils.deepReplaceKeyName(u,"__dot__",".")
        }
        for(var t=0;t<u.length;t++){
        if(!b.utils.exists(u[t].index)){
            u[t].index=t
            }
        }
    return u
};

this.getPlaylistItem=function(t){
    if(!b.utils.exists(t)){
        t=this.getCurrentItem()
        }
        return this.getPlaylist()[t]
    };
    
this.getPosition=function(){
    return this.callInternal("jwGetPosition")
    };
    
this.getRenderingMode=function(){
    return this.renderingMode
    };
    
this.getState=function(){
    return this.callInternal("jwGetState")
    };
    
this.getVolume=function(){
    return this.callInternal("jwGetVolume")
    };
    
this.getWidth=function(){
    return this.callInternal("jwGetWidth")
    };
    
this.setFullscreen=function(t){
    if(!b.utils.exists(t)){
        this.callInternal("jwSetFullscreen",!this.callInternal("jwGetFullscreen"))
        }else{
        this.callInternal("jwSetFullscreen",t)
        }
        return this
    };
    
this.setMute=function(t){
    if(!b.utils.exists(t)){
        this.callInternal("jwSetMute",!this.callInternal("jwGetMute"))
        }else{
        this.callInternal("jwSetMute",t)
        }
        return this
    };
    
this.lock=function(){
    return this
    };
    
this.unlock=function(){
    return this
    };
    
this.load=function(t){
    this.callInternal("jwLoad",t);
    return this
    };
    
this.playlistItem=function(t){
    this.callInternal("jwPlaylistItem",t);
    return this
    };
    
this.playlistPrev=function(){
    this.callInternal("jwPlaylistPrev");
    return this
    };
    
this.playlistNext=function(){
    this.callInternal("jwPlaylistNext");
    return this
    };
    
this.resize=function(u,t){
    if(this.renderingMode=="html5"){
        h.jwResize(u,t)
        }else{
        this.container.width=u;
        this.container.height=t;
        var v=document.getElementById(this.id+"_wrapper");
        if(v){
            v.style.width=u+"px";
            v.style.height=t+"px"
            }
        }
    return this
};

this.play=function(t){
    if(typeof t=="undefined"){
        t=this.getState();
        if(t==b.api.events.state.PLAYING||t==b.api.events.state.BUFFERING){
            this.callInternal("jwPause")
            }else{
            this.callInternal("jwPlay")
            }
        }
    else{
    this.callInternal("jwPlay",t)
    }
    return this
};

this.pause=function(t){
    if(typeof t=="undefined"){
        t=this.getState();
        if(t==b.api.events.state.PLAYING||t==b.api.events.state.BUFFERING){
            this.callInternal("jwPause")
            }
            else{
            this.callInternal("jwPlay")
            }
        }else{
    this.callInternal("jwPause",t)
    }
    return this
};

this.stop=function(){
    this.callInternal("jwStop");
    return this
    };
    
this.seek=function(t){
    this.callInternal("jwSeek",t);
    return this
    };
    
this.setVolume=function(t){
    this.callInternal("jwSetVolume",t);
    return this
    };
    
this.onBufferChange=function(t){
    return this.eventListener(b.api.events.JWPLAYER_MEDIA_BUFFER,t)
    };
    
this.onBufferFull=function(t){
    return this.eventListener(b.api.events.JWPLAYER_MEDIA_BUFFER_FULL,t)
    };
    
this.onError=function(t){
    return this.eventListener(b.api.events.JWPLAYER_ERROR,t)
    };
    
this.onFullscreen=function(t){
    return this.eventListener(b.api.events.JWPLAYER_FULLSCREEN,t)
    };
    
this.onMeta=function(t){
    return this.eventListener(b.api.events.JWPLAYER_MEDIA_META,t)
    };
    
this.onMute=function(t){
    return this.eventListener(b.api.events.JWPLAYER_MEDIA_MUTE,t)
    };
    
this.onPlaylist=function(t){
    return this.eventListener(b.api.events.JWPLAYER_PLAYLIST_LOADED,t)
    };
    
this.onPlaylistItem=function(t){
    return this.eventListener(b.api.events.JWPLAYER_PLAYLIST_ITEM,t)
    };
    
this.onReady=function(t){
    return this.eventListener(b.api.events.API_READY,t)
    };
    
this.onResize=function(t){
    return this.eventListener(b.api.events.JWPLAYER_RESIZE,t)
    };
    
this.onComplete=function(t){
    return this.eventListener(b.api.events.JWPLAYER_MEDIA_COMPLETE,t)
    };
    
this.onSeek=function(t){
    return this.eventListener(b.api.events.JWPLAYER_MEDIA_SEEK,t)
    };
    
this.onTime=function(t){
    return this.eventListener(b.api.events.JWPLAYER_MEDIA_TIME,t)
    };
    
this.onVolume=function(t){
    return this.eventListener(b.api.events.JWPLAYER_MEDIA_VOLUME,t)
    };
    
this.onBuffer=function(t){
    return this.stateListener(b.api.events.state.BUFFERING,t)
    };
    
this.onPause=function(t){
    return this.stateListener(b.api.events.state.PAUSED,t)
    };
    
this.onPlay=function(t){
    return this.stateListener(b.api.events.state.PLAYING,t)
    };
    
this.onIdle=function(t){
    return this.stateListener(b.api.events.state.IDLE,t)
    };
    
this.remove=function(){
    n={};
    
    j=[];
    if(b.utils.getOuterHTML(this.container)!=p){
        b.api.destroyPlayer(this.id,p)
        }
    };

this.setup=function(u){
    if(b.embed){
        var t=this.id;
        this.remove();
        var v=b(t);
        v.config=u;
        return new b.embed(v)
        }
        return this
    };
    
this.registerPlugin=function(v,u,t){
    b.plugins.registerPlugin(v,u,t)
    };
    
this.setPlayer=function(t,u){
    h=t;
    this.renderingMode=u
    };
    
this.stateListener=function(t,u){
    if(!s[t]){
        s[t]=[];
        this.eventListener(b.api.events.JWPLAYER_PLAYER_STATE,g(t))
        }
        s[t].push(u);
    return this
    };
    
this.detachMedia=function(){
    if(this.renderingMode=="html5"){
        return this.callInternal("jwDetachMedia")
        }
    };

this.attachMedia=function(){
    if(this.renderingMode=="html5"){
        return this.callInternal("jwAttachMedia")
        }
    };

function g(t){
    return function(v){
        var u=v.newstate,x=v.oldstate;
        if(u==t){
            var w=s[u];
            if(w){
                for(var y=0;y<w.length;y++){
                    if(typeof w[y]=="function"){
                        w[y].call(this,{
                            oldstate:x,
                            newstate:u
                        })
                        }
                    }
                }
        }
}
}
this.componentListener=function(t,u,v){
    if(!q[t]){
        q[t]={}
    }
    if(!q[t][u]){
    q[t][u]=[];
    this.eventListener(u,m(t,u))
    }
    q[t][u].push(v);
return this
};

function m(t,u){
    return function(w){
        if(t==w.component){
            var v=q[t][u];
            if(v){
                for(var x=0;x<v.length;x++){
                    if(typeof v[x]=="function"){
                        v[x].call(this,w)
                        }
                    }
                }
        }
}
}
this.addInternalListener=function(t,u){
    t.jwAddEventListener(u,'function(dat) { jwplayer("'+this.id+'").dispatchEvent("'+u+'", dat); }')
    };
    
this.eventListener=function(t,u){
    if(!n[t]){
        n[t]=[];
        if(h&&l){
            this.addInternalListener(h,t)
            }
        }
    n[t].push(u);
return this
};

this.dispatchEvent=function(v){
    if(n[v]){
        var u=f(v,arguments[1]);
        for(var t=0;t<n[v].length;t++){
            if(typeof n[v][t]=="function"){
                n[v][t].call(this,u)
                }
            }
        }
};

function f(v,t){
    var x=b.utils.extend({},t);
    if(v==b.api.events.JWPLAYER_FULLSCREEN&&!x.fullscreen){
        x.fullscreen=x.message=="true"?true:false;
        delete x.message
        }else{
        if(typeof x.data=="object"){
            x=b.utils.extend(x,x.data);
            delete x.data
            }
        }
    var u=["position","duration","offset"];
for(var w in u){
    if(x[u[w]]){
        x[u[w]]=Math.round(x[u[w]]*1000)/1000
        }
    }
return x
}
this.callInternal=function(u,t){
    if(l){
        if(typeof h!="undefined"&&typeof h[u]=="function"){
            if(b.utils.exists(t)){
                return(h[u])(t)
                }else{
                return(h[u])()
                }
            }
        return null
    }else{
    j.push({
        method:u,
        parameters:t
    })
    }
};

this.playerReady=function(v){
    l=true;
    if(!h){
        this.setPlayer(document.getElementById(v.id))
        }
        this.container=document.getElementById(this.id);
    for(var t in n){
        this.addInternalListener(h,t)
        }
        this.eventListener(b.api.events.JWPLAYER_PLAYLIST_ITEM,function(w){
        r={}
    });
this.eventListener(b.api.events.JWPLAYER_MEDIA_META,function(w){
    b.utils.extend(r,w.metadata)
    });
this.dispatchEvent(b.api.events.API_READY);
while(j.length>0){
    var u=j.shift();
    this.callInternal(u.method,u.parameters)
    }
};

this.getItemMeta=function(){
    return r
    };
    
this.getCurrentItem=function(){
    return this.callInternal("jwGetPlaylistIndex")
    };
    
function o(v,x,w){
    var t=[];
    if(!x){
        x=0
        }
        if(!w){
        w=v.length-1
        }
        for(var u=x;u<=w;u++){
        t.push(v[u])
        }
        return t
    }
    return this
};

b.api.selectPlayer=function(d){
    var c;
    if(!b.utils.exists(d)){
        d=0
        }
        if(d.nodeType){
        c=d
        }else{
        if(typeof d=="string"){
            c=document.getElementById(d)
            }
        }
    if(c){
    var e=b.api.playerById(c.id);
    if(e){
        return e
        }else{
        return b.api.addPlayer(new b.api(c))
        }
    }else{
    if(typeof d=="number"){
        return b.getPlayers()[d]
        }
    }
return null
};

b.api.events={
    API_READY:"jwplayerAPIReady",
    JWPLAYER_READY:"jwplayerReady",
    JWPLAYER_FULLSCREEN:"jwplayerFullscreen",
    JWPLAYER_RESIZE:"jwplayerResize",
    JWPLAYER_ERROR:"jwplayerError",
    JWPLAYER_COMPONENT_SHOW:"jwplayerComponentShow",
    JWPLAYER_COMPONENT_HIDE:"jwplayerComponentHide",
    JWPLAYER_MEDIA_BUFFER:"jwplayerMediaBuffer",
    JWPLAYER_MEDIA_BUFFER_FULL:"jwplayerMediaBufferFull",
    JWPLAYER_MEDIA_ERROR:"jwplayerMediaError",
    JWPLAYER_MEDIA_LOADED:"jwplayerMediaLoaded",
    JWPLAYER_MEDIA_COMPLETE:"jwplayerMediaComplete",
    JWPLAYER_MEDIA_SEEK:"jwplayerMediaSeek",
    JWPLAYER_MEDIA_TIME:"jwplayerMediaTime",
    JWPLAYER_MEDIA_VOLUME:"jwplayerMediaVolume",
    JWPLAYER_MEDIA_META:"jwplayerMediaMeta",
    JWPLAYER_MEDIA_MUTE:"jwplayerMediaMute",
    JWPLAYER_PLAYER_STATE:"jwplayerPlayerState",
    JWPLAYER_PLAYLIST_LOADED:"jwplayerPlaylistLoaded",
    JWPLAYER_PLAYLIST_ITEM:"jwplayerPlaylistItem"
};

b.api.events.state={
    BUFFERING:"BUFFERING",
    IDLE:"IDLE",
    PAUSED:"PAUSED",
    PLAYING:"PLAYING"
};

b.api.playerById=function(d){
    for(var c=0;c<a.length;c++){
        if(a[c].id==d){
            return a[c]
            }
        }
    return null
};

b.api.addPlayer=function(c){
    for(var d=0;d<a.length;d++){
        if(a[d]==c){
            return c
            }
        }
    a.push(c);
return c
};

b.api.destroyPlayer=function(g,d){
    var f=-1;
    for(var j=0;j<a.length;j++){
        if(a[j].id==g){
            f=j;
            continue
        }
    }
    if(f>=0){
    var c=document.getElementById(a[f].id);
    if(document.getElementById(a[f].id+"_wrapper")){
        c=document.getElementById(a[f].id+"_wrapper")
        }
        if(c){
        if(d){
            b.utils.setOuterHTML(c,d)
            }else{
            var h=document.createElement("div");
            var e=c.id;
            if(c.id.indexOf("_wrapper")==c.id.length-8){
                newID=c.id.substring(0,c.id.length-8)
                }
                h.setAttribute("id",e);
            c.parentNode.replaceChild(h,c)
            }
        }
    a.splice(f,1)
}
return null
};

b.getPlayers=function(){
    return a.slice(0)
    }
})(jwplayer);
var _userPlayerReady=(typeof playerReady=="function")?playerReady:undefined;
playerReady=function(b){
    var a=jwplayer.api.playerById(b.id);
    if(a){
        a.playerReady(b)
        }else{
        jwplayer.api.selectPlayer(b.id).playerReady(b)
        }
        if(_userPlayerReady){
        _userPlayerReady.call(this,b)
        }
    };
(function(a){
    var c=a.utils;
    a.embed=function(h){
        var k={
            width:400,
            height:300,
            components:{
                controlbar:{
                    position:"over"
                }
            }
        };
    
var g=c.mediaparser.parseMedia(h.container);
    var f=new a.embed.config(c.extend(k,g,h.config),this);
    var j=a.plugins.loadPlugins(h.id,f.plugins);
    function d(n,m){
    for(var l in m){
        if(typeof n[l]=="function"){
            (n[l]).call(n,m[l])
            }
        }
    }
    function e(){
    if(j.getStatus()==c.loaderstatus.COMPLETE){
        for(var n=0;n<f.modes.length;n++){
            if(f.modes[n].type&&a.embed[f.modes[n].type]){
                var p=f.modes[n].config;
                var t=f;
                if(p){
                    t=c.extend(c.clone(f),p);
                    var s=["file","levels","playlist"];
                    for(var m=0;m<s.length;m++){
                        var q=s[m];
                        if(c.exists(p[q])){
                            for(var l=0;l<s.length;l++){
                                if(l!=m){
                                    var o=s[l];
                                    if(c.exists(t[o])&&!c.exists(p[o])){
                                        delete t[o]
                                    }
                                }
                            }
                        }
                    }
        }
        var r=new a.embed[f.modes[n].type](document.getElementById(h.id),f.modes[n],t,j,h);
if(r.supportsConfig()){
    r.embed();
    d(h,f.events);
    return h
    }
}
}
c.log("No suitable players found");
new a.embed.logo(c.extend({
    hide:true
},f.components.logo),"none",h.id)
}
}
j.addEventListener(a.events.COMPLETE,e);
j.addEventListener(a.events.ERROR,e);
j.load();
return h
};

function b(){
    if(!document.body){
        return setTimeout(b,15)
        }
        var d=c.selectors.getElementsByTagAndClass("video","jwplayer");
    for(var e=0;e<d.length;e++){
        var f=d[e];
        if(f.id==""){
            f.id="jwplayer_"+Math.round(Math.random()*100000)
            }
            a(f.id).setup({})
        }
    }
    b()
})(jwplayer);
(function(e){
    function h(){
        return[{
            type:"flash",
            src:"/jwplayer/player.swf"
        },{
            type:"html5"
        },{
            type:"download"
        }]
        }
        var a={
        players:"modes",
        autoplay:"autostart"
    };
    
    function b(n){
        var m=n.toLowerCase();
        var l=["left","right","top","bottom"];
        for(var k=0;k<l.length;k++){
            if(m==l[k]){
                return true
                }
            }
        return false
    }
    function c(l){
    var k=false;
    k=(l instanceof Array)||(typeof l=="object"&&!l.position&&!l.size);
    return k
    }
    function j(k){
    if(typeof k=="string"){
        if(parseInt(k).toString()==k||k.toLowerCase().indexOf("px")>-1){
            return parseInt(k)
            }
        }
    return k
}
var g=["playlist","dock","controlbar","logo","display"];
function f(k){
    var n={};
    
    switch(e.utils.typeOf(k.plugins)){
        case"object":
            for(var m in k.plugins){
            n[e.utils.getPluginName(m)]=m
            }
            break;
        case"string":
            var o=k.plugins.split(",");
            for(var l=0;l<o.length;l++){
            n[e.utils.getPluginName(o[l])]=o[l]
            }
            break
        }
        return n
    }
    function d(o,n,m,k){
    if(e.utils.typeOf(o[n])!="object"){
        o[n]={}
    }
    var l=o[n][m];
if(e.utils.typeOf(l)!="object"){
    o[n][m]=l={}
}
if(k){
    if(n=="plugins"){
        var p=e.utils.getPluginName(m);
        l[k]=o[p+"."+k];
        delete o[p+"."+k]
    }else{
        l[k]=o[m+"."+k];
        delete o[m+"."+k]
    }
}
}
e.embed.deserialize=function(l){
    var m=f(l);
    for(var k in m){
        d(l,"plugins",m[k])
        }
        for(var p in l){
        if(p.indexOf(".")>-1){
            var o=p.split(".");
            var n=o[0];
            var p=o[1];
            if(e.utils.isInArray(g,n)){
                d(l,"components",n,p)
                }else{
                if(m[n]){
                    d(l,"plugins",m[n],p)
                    }
                }
        }
    }
    return l
};

e.embed.config=function(k,u){
    var t=e.utils.extend({},k);
    var r;
    if(c(t.playlist)){
        r=t.playlist;
        delete t.playlist
        }
        t=e.embed.deserialize(t);
    t.height=j(t.height);
    t.width=j(t.width);
    if(typeof t.plugins=="string"){
        var l=t.plugins.split(",");
        if(typeof t.plugins!="object"){
            t.plugins={}
        }
        for(var p=0;p<l.length;p++){
        var q=e.utils.getPluginName(l[p]);
        if(typeof t[q]=="object"){
            t.plugins[l[p]]=t[q];
            delete t[q]
        }else{
            t.plugins[l[p]]={}
        }
    }
}
for(var s=0;s<g.length;s++){
    var o=g[s];
    if(e.utils.exists(t[o])){
        if(typeof t[o]!="object"){
            if(!t.components[o]){
                t.components[o]={}
            }
            if(o=="logo"){
            t.components[o].file=t[o]
            }else{
            t.components[o].position=t[o]
            }
            delete t[o]
    }else{
        if(!t.components[o]){
            t.components[o]={}
        }
        e.utils.extend(t.components[o],t[o]);
    delete t[o]
}
}
if(typeof t[o+"size"]!="undefined"){
    if(!t.components[o]){
        t.components[o]={}
    }
    t.components[o].size=t[o+"size"];
delete t[o+"size"]
}
}
if(typeof t.icons!="undefined"){
    if(!t.components.display){
        t.components.display={}
    }
    t.components.display.icons=t.icons;
delete t.icons
}
for(var n in a){
    if(t[n]){
        if(!t[a[n]]){
            t[a[n]]=t[n]
            }
            delete t[n]
    }
}
var m;
if(t.flashplayer&&!t.modes){
    m=h();
    m[0].src=t.flashplayer;
    delete t.flashplayer
    }else{
    if(t.modes){
        if(typeof t.modes=="string"){
            m=h();
            m[0].src=t.modes
            }else{
            if(t.modes instanceof Array){
                m=t.modes
                }else{
                if(typeof t.modes=="object"&&t.modes.type){
                    m=[t.modes]
                    }
                }
        }
    delete t.modes
}else{
    m=h()
    }
}
t.modes=m;
if(r){
    t.playlist=r
    }
    return t
}
})(jwplayer);
(function(a){
    a.embed.download=function(c,g,b,d,f){
        this.embed=function(){
            var k=a.utils.extend({},b);
            var q={};
            
            var j=b.width?b.width:480;
            if(typeof j!="number"){
                j=parseInt(j,10)
                }
                var m=b.height?b.height:320;
            if(typeof m!="number"){
                m=parseInt(m,10)
                }
                var u,o,n;
            var s={};
            
            if(b.playlist&&b.playlist.length){
                s.file=b.playlist[0].file;
                o=b.playlist[0].image;
                s.levels=b.playlist[0].levels
                }else{
                s.file=b.file;
                o=b.image;
                s.levels=b.levels
                }
                if(s.file){
                u=s.file
                }
                else{
                if(s.levels&&s.levels.length){
                    u=s.levels[0].file
                    }
                }
            n=u?"pointer":"auto";
        var l={
            display:{
                style:{
                    cursor:n,
                    width:j,
                    height:m,
                    backgroundColor:"#000",
                    position:"relative",
                    textDecoration:"none",
                    border:"none",
                    display:"block"
                }
            },
        display_icon:{
            style:{
                cursor:n,
                position:"absolute",
                display:u?"block":"none",
                top:0,
                left:0,
                border:0,
                margin:0,
                padding:0,
                zIndex:3,
                width:50,
                height:50,
                backgroundImage:"url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAALdJREFUeNrs18ENgjAYhmFouDOCcQJGcARHgE10BDcgTOIosAGwQOuPwaQeuFRi2p/3Sb6EC5L3QCxZBgAAAOCorLW1zMn65TrlkH4NcV7QNcUQt7Gn7KIhxA+qNIR81spOGkL8oFJDyLJRdosqKDDkK+iX5+d7huzwM40xptMQMkjIOeRGo+VkEVvIPfTGIpKASfYIfT9iCHkHrBEzf4gcUQ56aEzuGK/mw0rHpy4AAACAf3kJMACBxjAQNRckhwAAAABJRU5ErkJggg==)"
            }
        },
    display_iconBackground:{
        style:{
            cursor:n,
            position:"absolute",
            display:u?"block":"none",
            top:((m-50)/2),
            left:((j-50)/2),
            border:0,
            width:50,
            height:50,
            margin:0,
            padding:0,
            zIndex:2,
            backgroundImage:"url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAEpJREFUeNrszwENADAIA7DhX8ENoBMZ5KR10EryckCJiIiIiIiIiIiIiIiIiIiIiIh8GmkRERERERERERERERERERERERGRHSPAAPlXH1phYpYaAAAAAElFTkSuQmCC)"
        }
    },
display_image:{
    style:{
        width:j,
        height:m,
        display:o?"block":"none",
        position:"absolute",
        cursor:n,
        left:0,
        top:0,
        margin:0,
        padding:0,
        textDecoration:"none",
        zIndex:1,
        border:"none"
    }
}
};

var h=function(v,x,y){
    var w=document.createElement(v);
    if(y){
        w.id=y
        }else{
        w.id=c.id+"_jwplayer_"+x
        }
        a.utils.css(w,l[x].style);
    return w
    };
    
q.display=h("a","display",c.id);
if(u){
    q.display.setAttribute("href",a.utils.getAbsolutePath(u))
    }
    q.display_image=h("img","display_image");
q.display_image.setAttribute("alt","Click to download...");
if(o){
    q.display_image.setAttribute("src",a.utils.getAbsolutePath(o))
    }
    if(true){
    q.display_icon=h("div","display_icon");
    q.display_iconBackground=h("div","display_iconBackground");
    q.display.appendChild(q.display_image);
    q.display_iconBackground.appendChild(q.display_icon);
    q.display.appendChild(q.display_iconBackground)
    }
    _css=a.utils.css;
_hide=function(v){
    _css(v,{
        display:"none"
    })
    };
    
function r(v){
    _imageWidth=q.display_image.naturalWidth;
    _imageHeight=q.display_image.naturalHeight;
    t()
    }
    function t(){
    a.utils.stretch(a.utils.stretching.UNIFORM,q.display_image,j,m,_imageWidth,_imageHeight)
    }
    q.display_image.onerror=function(v){
    _hide(q.display_image)
    };
    
q.display_image.onload=r;
c.parentNode.replaceChild(q.display,c);
var p=(b.plugins&&b.plugins.logo)?b.plugins.logo:{};

q.display.appendChild(new a.embed.logo(b.components.logo,"download",c.id));
f.container=document.getElementById(f.id);
f.setPlayer(q.display,"download")
};

this.supportsConfig=function(){
    if(b){
        var j=a.utils.getFirstPlaylistItemFromConfig(b);
        if(typeof j.file=="undefined"&&typeof j.levels=="undefined"){
            return true
            }else{
            if(j.file){
                return e(j.file,j.provider,j.playlistfile)
                }else{
                if(j.levels&&j.levels.length){
                    for(var h=0;h<j.levels.length;h++){
                        if(j.levels[h].file&&e(j.levels[h].file,j.provider,j.playlistfile)){
                            return true
                            }
                        }
                    }
            }
}
}else{
    return true
    }
};

function e(j,l,h){
    if(h){
        return false
        }
        var k=["image","sound","youtube","http"];
    if(l&&(k.toString().indexOf(l)>-1)){
        return true
        }
        if(!l||(l&&l=="video")){
        var m=a.utils.extension(j);
        if(m&&a.utils.extensionmap[m]){
            return true
            }
        }
    return false
}
}
})(jwplayer);
(function(a){
    a.embed.flash=function(f,g,l,e,j){
        function m(o,n,p){
            var q=document.createElement("param");
            q.setAttribute("name",n);
            q.setAttribute("value",p);
            o.appendChild(q)
            }
            function k(o,p,n){
            return function(q){
                if(n){
                    document.getElementById(j.id+"_wrapper").appendChild(p)
                    }
                    var s=document.getElementById(j.id).getPluginConfig("display");
                o.resize(s.width,s.height);
                var r={
                    left:s.x,
                    top:s.y
                    };
                    
                a.utils.css(p,r)
                }
            }
        function d(p){
        if(!p){
            return{}
        }
        var r={};
    
    for(var o in p){
        var n=p[o];
        for(var q in n){
            r[o+"."+q]=n[q]
            }
        }
        return r
}
function h(q,p){
    if(q[p]){
        var s=q[p];
        for(var o in s){
            var n=s[o];
            if(typeof n=="string"){
                if(!q[o]){
                    q[o]=n
                    }
                }else{
            for(var r in n){
                if(!q[o+"."+r]){
                    q[o+"."+r]=n[r]
                    }
                }
            }
        }
    delete q[p]
}
}
function b(q){
    if(!q){
        return{}
    }
    var t={},s=[];
for(var n in q){
    var p=a.utils.getPluginName(n);
    var o=q[n];
    s.push(n);
    for(var r in o){
        t[p+"."+r]=o[r]
        }
    }
    t.plugins=s.join(",");
return t
}
function c(p){
    var n=p.netstreambasepath?"":"netstreambasepath="+encodeURIComponent(window.location.href.split("#")[0])+"&";
    for(var o in p){
        if(typeof(p[o])=="object"){
            n+=o+"="+encodeURIComponent("[[JSON]]"+a.utils.strings.jsonToString(p[o]))+"&"
            }else{
            n+=o+"="+encodeURIComponent(p[o])+"&"
            }
        }
    return n.substring(0,n.length-1)
}
this.embed=function(){
    l.id=j.id;
    var y;
    var q=a.utils.extend({},l);
    var n=q.width;
    var w=q.height;
    if(f.id+"_wrapper"==f.parentNode.id){
        y=document.getElementById(f.id+"_wrapper")
        }else{
        y=document.createElement("div");
        y.id=f.id+"_wrapper";
        a.utils.wrap(f,y);
        a.utils.css(y,{
            position:"relative",
            width:n,
            height:w
        })
        }
        var o=e.setupPlugins(j,q,k);
    if(o.length>0){
        a.utils.extend(q,b(o.plugins))
        }else{
        delete q.plugins
        }
        var r=["height","width","modes","events"];
    for(var u=0;u<r.length;u++){
        delete q[r[u]]
    }
    var p="opaque";
    if(q.wmode){
        p=q.wmode
        }
        h(q,"components");
    h(q,"providers");
    if(typeof q["dock.position"]!="undefined"){
        if(q["dock.position"].toString().toLowerCase()=="false"){
            q.dock=q["dock.position"];
            delete q["dock.position"]
        }
    }
    var x="#000000";
    var t;
////Config here/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if(a.utils.isIE()){
    var v='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" bgcolor="'+x+'" width="100%" height="100%" id="'+f.id+'" name="'+f.id+'" tabindex=0"">';
    v+='<param name="movie" value="'+g.src+'">';
    v+='<param name="allowfullscreen" value="true">';
    v+='<param name="allowscriptaccess" value="always">';
    v+='<param name="seamlesstabbing" value="true">';
    v+='<param name="wmode" value="'+p+'">';
    v+='<param name="flashvars" value="'+c(q)+'">';
    v+="</object>";
    a.utils.setOuterHTML(f,v);
    t=document.getElementById(f.id)
    }else{
    var s=document.createElement("object");
    s.setAttribute("type","application/x-shockwave-flash");
    s.setAttribute("data",g.src);
    s.setAttribute("width","100%");
    s.setAttribute("height","100%");
    s.setAttribute("bgcolor","#000000");
    s.setAttribute("id",f.id);
    s.setAttribute("name",f.id);
    s.setAttribute("tabindex",0);
    m(s,"allowfullscreen","true");
    m(s,"allowscriptaccess","always");
    m(s,"seamlesstabbing","true");
    m(s,"wmode",p);
    m(s,"flashvars",c(q));
    f.parentNode.replaceChild(s,f);
    t=s
    }
    j.container=t;
j.setPlayer(t,"flash")
};

this.supportsConfig=function(){
    if(a.utils.hasFlash()){
        if(l){
            var o=a.utils.getFirstPlaylistItemFromConfig(l);
            if(typeof o.file=="undefined"&&typeof o.levels=="undefined"){
                return true
                }else{
                if(o.file){
                    return flashCanPlay(o.file,o.provider)
                    }else{
                    if(o.levels&&o.levels.length){
                        for(var n=0;n<o.levels.length;n++){
                            if(o.levels[n].file&&flashCanPlay(o.levels[n].file,o.provider)){
                                return true
                                }
                            }
                        }
                }
    }
}else{
    return true
    }
}
return false
};
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
flashCanPlay=function(n,p){
    var o=["video","http","sound","image"];
    if(p&&(o.toString().indexOf(p<0))){
        return true
        }
        var q=a.utils.extension(n);
    if(!q){
        return true
        }
        if(a.utils.exists(a.utils.extensionmap[q])&&!a.utils.exists(a.utils.extensionmap[q].flash)){
        return false
        }
        return true
    }
}
})(jwplayer);
(function(a){
    a.embed.html5=function(c,g,b,d,f){
        function e(j,k,h){
            return function(l){
                var m=document.getElementById(c.id+"_displayarea");
                if(h){
                    m.appendChild(k)
                    }
                    j.resize(m.clientWidth,m.clientHeight);
                k.left=m.style.left;
                k.top=m.style.top
                }
            }
        this.embed=function(){
        if(a.html5){
            d.setupPlugins(f,b,e);
            c.innerHTML="";
            var j=a.utils.extend({
                screencolor:"0x000000"
            },b);
            var h=["plugins","modes","events"];
            for(var k=0;k<h.length;k++){
                delete j[h[k]]
            }
            if(j.levels&&!j.sources){
                j.sources=b.levels
                }
                if(j.skin&&j.skin.toLowerCase().indexOf(".zip")>0){
                j.skin=j.skin.replace(/\.zip/i,".xml")
                }
                var l=new (a.html5(c)).setup(j);
            f.container=document.getElementById(f.id);
            f.setPlayer(l,"html5")
            }else{
            return null
            }
        };
    
this.supportsConfig=function(){
    if(!!a.vid.canPlayType){
        if(b){
            var j=a.utils.getFirstPlaylistItemFromConfig(b);
            if(typeof j.file=="undefined"&&typeof j.levels=="undefined"){
                return true
                }else{
                if(j.file){
                    return html5CanPlay(a.vid,j.file,j.provider,j.playlistfile)
                    }else{
                    if(j.levels&&j.levels.length){
                        for(var h=0;h<j.levels.length;h++){
                            if(j.levels[h].file&&html5CanPlay(a.vid,j.levels[h].file,j.provider,j.playlistfile)){
                                return true
                                }
                            }
                        }
                }
    }
}
else{
    return true
    }
}
return false
};

html5CanPlay=function(k,j,l,h){
    if(h){
        return false
        }
        if(l&&l=="youtube"){
        return true
        }
        if(l&&l!="video"&&l!="http"&&l!="sound"){
        return false
        }
        var m=a.utils.extension(j);
    if(!a.utils.exists(m)||!a.utils.exists(a.utils.extensionmap[m])){
        return true
        }
        if(!a.utils.exists(a.utils.extensionmap[m].html5)){
        return false
        }
        if(a.utils.isLegacyAndroid()&&m.match(/m4v|mp4/)){
        return true
        }
        return browserCanPlay(k,a.utils.extensionmap[m].html5)
    };
 //////////////////////////////////////////////////////////////////////////////////////////////////////////   
browserCanPlay=function(j,h){
    if(!h){
        return true
        }
        if(j.canPlayType(h)){
        return true
        }
        else{
        if(h=="audio/mp3"&&navigator.userAgent.match(/safari/i)){
            return j.canPlayType("audio/mpeg")
            }else{
            return false
            }
        }
}
}
})(jwplayer);
(function(a){
    a.embed.logo=function(m,l,d){
        var j={
            prefix:"http://l.longtailvideo.com/"+l+"/",
            file:"logo.png",
            link:"http://www.longtailvideo.com/players/jw-flv-player/",
            margin:8,
            out:0.5,
            over:1,
            timeout:5,
            hide:false,
            position:"bottom-left"
        };
        
        _css=a.utils.css;
        var b;
        var h;
        k();
        function k(){
            o();
            c();
            f()
            }
            function o(){
            if(j.prefix){
                var q=a.version.split(/\W/).splice(0,2).join("/");
                if(j.prefix.indexOf(q)<0){
                    j.prefix+=q+"/"
                    }
                }
            h=a.utils.extend({},j)
        }
        function p(){
        var s={
            border:"none",
            textDecoration:"none",
            position:"absolute",
            cursor:"pointer",
            zIndex:10
        };
        
        s.display=h.hide?"none":"block";
        var r=h.position.toLowerCase().split("-");
        for(var q in r){
            s[r[q]]=h.margin
            }
            return s
        }
        function c(){
        b=document.createElement("img");
        b.id=d+"_jwplayer_logo";
        b.style.display="none";
        b.onload=function(q){
            _css(b,p());
            e()
            };
            
        if(!h.file){
            return
        }
        if(h.file.indexOf("http://")===0){
            b.src=h.file
            }
            else{
            b.src=h.prefix+h.file
            }
        }
    if(!h.file){
    return
}
function f(){
    if(h.link){
        b.onmouseover=g;
        b.onmouseout=e;
        b.onclick=n
        }else{
        this.mouseEnabled=false
        }
    }
function n(q){
    if(typeof q!="undefined"){
        q.preventDefault();
        q.stopPropagation()
        }
        if(h.link){
        window.open(h.link,"_blank")
        }
        return
}
function e(q){
    if(h.link){
        b.style.opacity=h.out
        }
        return
}
function g(q){
    if(h.hide){
        b.style.opacity=h.over
        }
        return
}
return b
}
})(jwplayer);
(function(a){
    a.html5=function(b){
        var c=b;
        this.setup=function(d){
            a.utils.extend(this,new a.html5.api(c,d));
            return this
            };
            
        return this
        }
    })(jwplayer);
(function(a){
    var c=a.utils;
    var b=c.css;
    a.html5.view=function(s,r,e){
        var w=s;
        var m=r;
        var y=e;
        var x;
        var f;
        var G;
        var t;
        var H;
        var p;
        var E;
        var q=false;
        var B,o;
        function A(){
            x=document.createElement("div");
            x.id=m.id;
            x.className=m.className;
            _videowrapper=document.createElement("div");
            _videowrapper.id=x.id+"_video_wrapper";
            m.id=x.id+"_video";
            b(x,{
                position:"relative",
                height:y.height,
                width:y.width,
                padding:0,
                backgroundColor:I(),
                zIndex:0
            });
            function I(){
                if(w.skin.getComponentSettings("display")&&w.skin.getComponentSettings("display").backgroundcolor){
                    return w.skin.getComponentSettings("display").backgroundcolor
                    }
                    return parseInt("000000",16)
                }
                b(m,{
                width:"100%",
                height:"100%",
                top:0,
                left:0,
                zIndex:1,
                margin:"auto",
                display:"block"
            });
            b(_videowrapper,{
                overflow:"hidden",
                position:"absolute",
                top:0,
                left:0,
                bottom:0,
                right:0
            });
            c.wrap(m,x);
            c.wrap(m,_videowrapper);
            t=document.createElement("div");
            t.id=x.id+"_displayarea";
            x.appendChild(t)
            }
            function j(){
            for(var I=0;I<y.plugins.order.length;I++){
                var J=y.plugins.order[I];
                if(c.exists(y.plugins.object[J].getDisplayElement)){
                    y.plugins.object[J].height=c.parseDimension(y.plugins.object[J].getDisplayElement().style.height);
                    y.plugins.object[J].width=c.parseDimension(y.plugins.object[J].getDisplayElement().style.width);
                    y.plugins.config[J].currentPosition=y.plugins.config[J].position
                    }
                }
            v()
        }
        function l(I){
        b(t,{
            display:(y.getMedia()&&y.getMedia().hasChrome()&&I.newstate!=a.api.events.state.IDLE)?"none":"block"
            })
        }
        function v(J){
        var L=y.getMedia()?y.getMedia().getDisplayElement():null;
        if(c.exists(L)){
            if(E!=L){
                if(E&&E.parentNode){
                    E.parentNode.replaceChild(L,E)
                    }
                    E=L
                }
                for(var I=0;I<y.plugins.order.length;I++){
                var K=y.plugins.order[I];
                if(c.exists(y.plugins.object[K].getDisplayElement)){
                    y.plugins.config[K].currentPosition=y.plugins.config[K].position
                    }
                }
            }
        h(y.width,y.height)
    }
    this.setup=function(){
    if(y&&y.getMedia()){
        m=y.getMedia().getDisplayElement()
        }
        A();
    j();
    w.jwAddEventListener(a.api.events.JWPLAYER_PLAYER_STATE,l);
    w.jwAddEventListener(a.api.events.JWPLAYER_MEDIA_LOADED,v);
    w.jwAddEventListener(a.api.events.JWPLAYER_MEDIA_META,function(){
        z()
        });
    var I;
    if(c.exists(window.onresize)){
        I=window.onresize
        }
        window.onresize=function(J){
        if(c.exists(I)){
            try{
                I(J)
                }catch(L){}
        }
        if(w.jwGetFullscreen()){
        if(!C()){
            var K=c.getBoundingClientRect(document.body);
            y.width=Math.abs(K.left)+Math.abs(K.right);
            y.height=window.innerHeight;
            h(y.width,y.height)
            }
        }else{
    h(y.width,y.height)
    }
}
};

function g(I){
    switch(I.keyCode){
        case 27:
            if(w.jwGetFullscreen()){
            w.jwSetFullscreen(false)
            }
            break;
        case 32:
            if(w.jwGetState()!=a.api.events.state.IDLE&&w.jwGetState()!=a.api.events.state.PAUSED){
            w.jwPause()
            }else{
            w.jwPlay()
            }
            break
        }
        }
function h(L,I){
    if(x.style.display=="none"){
        return
    }
    var K=[].concat(y.plugins.order);
    K.reverse();
    H=K.length+2;
    if(C()){
        try{
            if(y.fullscreen&&!y.getMedia().getDisplayElement().webkitDisplayingFullscreen){
                y.fullscreen=false
                }
            }catch(N){}
}
if(!y.fullscreen){
    f=L;
    G=I;
    if(typeof L=="string"&&L.indexOf("%")>0){
        f=c.getElementWidth(c.parentNode(x))*parseInt(L.replace("%"),"")/100
        }else{
        f=L
        }
        if(typeof I=="string"&&I.indexOf("%")>0){
        G=c.getElementHeight(c.parentNode(x))*parseInt(I.replace("%"),"")/100
        }else{
        G=I
        }
        b(t,{
        top:0,
        bottom:0,
        left:0,
        right:0,
        width:f,
        height:G,
        position:"absolute"
    });
    b(x,{
        height:G,
        width:f
    });
    var J=n(u,K);
    if(J.length>0){
        H+=J.length;
        var O=J.indexOf("playlist"),M=J.indexOf("controlbar");
        if(O>=0&&M>=0){
            J[O]=J.splice(M,1,J[O])[0]
            }
            n(k,J,true)
        }
        B=c.getElementWidth(t);
    o=c.getElementHeight(t)
    }else{
    if(!C()){
        n(F,K,true)
        }
    }
z()
}
function n(P,L,M){
    var N=[];
    for(var K=0;K<L.length;K++){
        var O=L[K];
        if(c.exists(y.plugins.object[O].getDisplayElement)){
            if(y.plugins.config[O].currentPosition!=a.html5.view.positions.NONE){
                var I=P(O,H--);
                if(!I){
                    N.push(O)
                    }else{
                    var J=I.width;
                    var Q=I.height;
                    if(M){
                        delete I.width;
                        delete I.height
                        }
                        b(y.plugins.object[O].getDisplayElement(),I);
                    y.plugins.object[O].resize(J,Q)
                    }
                }else{
            b(y.plugins.object[O].getDisplayElement(),{
                display:"none"
            })
            }
        }
    }
return N
}
function u(J,K){
    if(c.exists(y.plugins.object[J].getDisplayElement)){
        if(y.plugins.config[J].position&&D(y.plugins.config[J].position)){
            if(!c.exists(y.plugins.object[J].getDisplayElement().parentNode)){
                x.appendChild(y.plugins.object[J].getDisplayElement())
                }
                var I=d(J);
            I.zIndex=K;
            return I
            }
        }
    return false
}
function k(I,J){
    if(!c.exists(y.plugins.object[I].getDisplayElement().parentNode)){
        t.appendChild(y.plugins.object[I].getDisplayElement())
        }
        return{
        position:"absolute",
        width:(c.getElementWidth(t)-c.parseDimension(t.style.left)-c.parseDimension(t.style.right)),
        height:(c.getElementHeight(t)-c.parseDimension(t.style.top)-c.parseDimension(t.style.bottom)),
        zIndex:J
    }
}
function F(I,J){
    return{
        position:"fixed",
        width:y.width,
        height:y.height,
        zIndex:J
    }
}
function z(){
    if(!c.exists(y.getMedia())){
        return
    }
    t.style.position="absolute";
    var K=y.getMedia().getDisplayElement();
    if(K&&K.tagName.toLowerCase()=="video"){
        K.style.position="absolute";
        if(K.parentNode){
            K.parentNode.style.left=t.style.left;
            K.parentNode.style.top=t.style.top
            }
            if(y.fullscreen&&w.jwGetStretching()==a.utils.stretching.EXACTFIT&&!c.isMobile()){
            var I=document.createElement("div");
            c.stretch(a.utils.stretching.UNIFORM,I,c.getElementWidth(t),c.getElementHeight(t),B,o);
            c.stretch(a.utils.stretching.EXACTFIT,K,c.parseDimension(I.style.width),c.parseDimension(I.style.height),K.videoWidth?K.videoWidth:400,K.videoHeight?K.videoHeight:300);
            b(K,{
                left:I.style.left,
                top:I.style.top
                })
            }else{
            c.stretch(w.jwGetStretching(),K,c.getElementWidth(t),c.getElementHeight(t),K.videoWidth?K.videoWidth:400,K.videoHeight?K.videoHeight:300)
            }
        }else{
    var J=y.plugins.object.display.getDisplayElement();
    if(J){
        y.getMedia().resize(c.parseDimension(J.style.width),c.parseDimension(J.style.height))
        }else{
        y.getMedia().resize(c.parseDimension(t.style.width),c.parseDimension(t.style.height))
        }
    }
}
function d(J){
    var K={
        position:"absolute",
        margin:0,
        padding:0,
        top:null
    };
    
    var I=y.plugins.config[J].currentPosition.toLowerCase();
    switch(I.toUpperCase()){
        case a.html5.view.positions.TOP:
            K.top=c.parseDimension(t.style.top);
            K.left=c.parseDimension(t.style.left);
            K.width=c.getElementWidth(t)-c.parseDimension(t.style.left)-c.parseDimension(t.style.right);
            K.height=y.plugins.object[J].height;
            t.style[I]=c.parseDimension(t.style[I])+y.plugins.object[J].height+"px";
            t.style.height=c.getElementHeight(t)-K.height+"px";
            break;
        case a.html5.view.positions.RIGHT:
            K.top=c.parseDimension(t.style.top);
            K.right=c.parseDimension(t.style.right);
            K.width=y.plugins.object[J].width;
            K.height=c.getElementHeight(t)-c.parseDimension(t.style.top)-c.parseDimension(t.style.bottom);
            t.style.width=c.getElementWidth(t)-K.width+"px";
            break;
        case a.html5.view.positions.BOTTOM:
            K.bottom=c.parseDimension(t.style.bottom);
            K.left=c.parseDimension(t.style.left);
            K.width=c.getElementWidth(t)-c.parseDimension(t.style.left)-c.parseDimension(t.style.right);
            K.height=y.plugins.object[J].height;
            t.style.height=c.getElementHeight(t)-K.height+"px";
            break;
        case a.html5.view.positions.LEFT:
            K.top=c.parseDimension(t.style.top);
            K.left=c.parseDimension(t.style.left);
            K.width=y.plugins.object[J].width;
            K.height=c.getElementHeight(t)-c.parseDimension(t.style.top)-c.parseDimension(t.style.bottom);
            t.style[I]=c.parseDimension(t.style[I])+y.plugins.object[J].width+"px";
            t.style.width=c.getElementWidth(t)-K.width+"px";
            break;
        default:
            break
            }
            return K
    }
    this.resize=h;
this.fullscreen=function(L){
    var N;
    try{
        N=y.getMedia().getDisplayElement()
        }catch(M){}
    if(C()&&N&&N.webkitSupportsFullscreen){
        if(L&&!N.webkitDisplayingFullscreen){
            try{
                c.transform(N);
                N.webkitEnterFullscreen()
                }catch(K){}
        }else{
        if(!L){
            z();
            if(N.webkitDisplayingFullscreen){
                try{
                    N.webkitExitFullscreen()
                    }catch(K){}
            }
        }
}
q=false
}else{
    if(L){
        document.onkeydown=g;
        clearInterval(p);
        var J=c.getBoundingClientRect(document.body);
        y.width=Math.abs(J.left)+Math.abs(J.right);
        y.height=window.innerHeight;
        var I={
            position:"fixed",
            width:"100%",
            height:"100%",
            top:0,
            left:0,
            zIndex:2147483000
        };
        
        b(x,I);
        I.zIndex=1;
        if(y.getMedia()&&y.getMedia().getDisplayElement()){
            b(y.getMedia().getDisplayElement(),I)
            }
            I.zIndex=2;
        b(t,I);
        q=true
        }else{
        document.onkeydown="";
        y.width=f;
        y.height=G;
        b(x,{
            position:"relative",
            height:y.height,
            width:y.width,
            zIndex:0
        });
        q=false
        }
        h(y.width,y.height)
    }
};

function D(I){
    return([a.html5.view.positions.TOP,a.html5.view.positions.RIGHT,a.html5.view.positions.BOTTOM,a.html5.view.positions.LEFT].toString().indexOf(I.toUpperCase())>-1)
    }
    function C(){
    if(w.jwGetState()!=a.api.events.state.IDLE&&!q&&(y.getMedia()&&y.getMedia().getDisplayElement()&&y.getMedia().getDisplayElement().webkitSupportsFullscreen)&&c.useNativeFullscreen()){
        return true
        }
        return false
    }
};

a.html5.view.positions={
    TOP:"TOP",
    RIGHT:"RIGHT",
    BOTTOM:"BOTTOM",
    LEFT:"LEFT",
    OVER:"OVER",
    NONE:"NONE"
}
})(jwplayer);
(function(a){
    var b={
        backgroundcolor:"",
        margin:10,
        font:"Arial,sans-serif",
        fontsize:10,
        fontcolor:parseInt("000000",16),
        fontstyle:"normal",
        fontweight:"bold",
        buttoncolor:parseInt("ffffff",16),
        position:a.html5.view.positions.BOTTOM,
        idlehide:false,
        hideplaylistcontrols:false,
        layout:{
            left:{
                position:"left",
                elements:[{
                    name:"play",
                    type:"button"
                },{
                    name:"divider",
                    type:"divider"
                },{
                    name:"prev",
                    type:"button"
                },{
                    name:"divider",
                    type:"divider"
                },{
                    name:"next",
                    type:"button"
                },{
                    name:"divider",
                    type:"divider"
                },{
                    name:"elapsed",
                    type:"text"
                }]
                },
            center:{
                position:"center",
                elements:[{
                    name:"time",
                    type:"slider"
                }]
                },
            right:{
                position:"right",
                elements:[{
                    name:"duration",
                    type:"text"
                },{
                    name:"blank",
                    type:"button"
                },{
                    name:"divider",
                    type:"divider"
                },{
                    name:"mute",
                    type:"button"
                },{
                    name:"volume",
                    type:"slider"
                },{
                    name:"divider",
                    type:"divider"
                },{
                    name:"fullscreen",
                    type:"button"
                }]
                }
            }
    };

_utils=a.utils;
_css=_utils.css;
_hide=function(c){
    _css(c,{
        display:"none"
    })
    };
    
_show=function(c){
    _css(c,{
        display:"block"
    })
    };
    
a.html5.controlbar=function(m,X){
    window.controlbar=this;
    var l=m;
    var D=_utils.extend({},b,l.skin.getComponentSettings("controlbar"),X);
    if(D.position==a.html5.view.positions.NONE||typeof a.html5.view.positions[D.position]=="undefined"){
        return
    }
    if(_utils.mapLength(l.skin.getComponentLayout("controlbar"))>0){
        D.layout=l.skin.getComponentLayout("controlbar")
        }
        var af;
    var Q;
    var ae;
    var E;
    var w="none";
    var h;
    var k;
    var ag;
    var g;
    var f;
    var z;
    var R={};
    
    var q=false;
    var c={};
    
    var ab;
    var j=false;
    var p;
    var d;
    var U=false;
    var G=false;
    var H;
    var Z=new a.html5.eventdispatcher();
    _utils.extend(this,Z);
    function K(){
        if(!ab){
            ab=l.skin.getSkinElement("controlbar","background");
            if(!ab){
                ab={
                    width:0,
                    height:0,
                    src:null
                }
            }
        }
    return ab
}
function O(){
    ae=0;
    E=0;
    Q=0;
    if(!q){
        var ao={
            height:K().height,
            backgroundColor:D.backgroundcolor
            };
            
        af=document.createElement("div");
        af.id=l.id+"_jwplayer_controlbar";
        _css(af,ao)
        }
        var an=(l.skin.getSkinElement("controlbar","capLeft"));
    var am=(l.skin.getSkinElement("controlbar","capRight"));
    if(an){
        y("capLeft","left",false,af)
        }
        ac("background",af,{
        position:"absolute",
        height:K().height,
        left:(an?an.width:0),
        zIndex:0
    },"img");
    if(K().src){
        R.background.src=K().src
        }
        ac("elements",af,{
        position:"relative",
        height:K().height,
        zIndex:1
    });
    if(am){
        y("capRight","right",false,af)
        }
    }
this.getDisplayElement=function(){
    return af
    };
    
this.resize=function(ao,am){
    S();
    _utils.cancelAnimation(af);
    f=ao;
    z=am;
    if(G!=l.jwGetFullscreen()){
        G=l.jwGetFullscreen();
        d=undefined
        }
        var an=x();
    J({
        id:l.id,
        duration:ag,
        position:k
    });
    v({
        id:l.id,
        bufferPercent:g
    });
    return an
    };
    
this.show=function(){
    if(j){
        j=false;
        _show(af);
        V()
        }
    };

this.hide=function(){
    if(!j){
        j=true;
        _hide(af);
        ad()
        }
    };

function r(){
    var an=["timeSlider","volumeSlider","timeSliderRail","volumeSliderRail"];
    for(var ao in an){
        var am=an[ao];
        if(typeof R[am]!="undefined"){
            c[am]=_utils.getBoundingClientRect(R[am])
            }
        }
    }
    var e;
function Y(am){
    if(j){
        return
    }
    clearTimeout(p);
    if(D.position==a.html5.view.positions.OVER||l.jwGetFullscreen()){
        switch(l.jwGetState()){
            case a.api.events.state.PAUSED:case a.api.events.state.IDLE:
                if(af&&af.style.opacity<1&&(!D.idlehide||_utils.exists(am))){
                e=false;
                setTimeout(function(){
                    if(!e){
                        W()
                        }
                    },100)
            }
            if(D.idlehide){
                p=setTimeout(function(){
                    A()
                    },2000)
                }
                break;
        default:
            e=true;
            if(am){
            W()
            }
            p=setTimeout(function(){
            A()
            },2000);
        break
        }
        }else{
    W()
    }
}
function A(){
    if(!j){
        ad();
        if(af.style.opacity==1){
            _utils.cancelAnimation(af);
            _utils.fadeTo(af,0,0.1,1,0)
            }
        }
}
function W(){
    if(!j){
        V();
        if(af.style.opacity==0){
            _utils.cancelAnimation(af);
            _utils.fadeTo(af,1,0.1,0,0)
            }
        }
}
function I(am){
    return function(){
        if(U&&d!=am){
            d=am;
            Z.sendEvent(am,{
                component:"controlbar",
                boundingRect:P()
                })
            }
        }
}
var V=I(a.api.events.JWPLAYER_COMPONENT_SHOW);
var ad=I(a.api.events.JWPLAYER_COMPONENT_HIDE);
function P(){
    if(D.position==a.html5.view.positions.OVER||l.jwGetFullscreen()){
        return _utils.getDimensions(af)
        }else{
        return{
            x:0,
            y:0,
            width:0,
            height:0
        }
    }
}
function ac(aq,ap,ao,am){
    var an;
    if(!q){
        if(!am){
            am="div"
            }
            an=document.createElement(am);
        R[aq]=an;
        an.id=af.id+"_"+aq;
        ap.appendChild(an)
        }else{
        an=document.getElementById(af.id+"_"+aq)
        }
        if(_utils.exists(ao)){
        _css(an,ao)
        }
        return an
    }
    function N(){
    if(l.jwGetHeight()<=40){
        D.layout=_utils.clone(D.layout);
        for(var am=0;am<D.layout.left.elements.length;am++){
            if(D.layout.left.elements[am].name=="fullscreen"){
                D.layout.left.elements.splice(am,1)
                }
            }
        for(am=0;am<D.layout.right.elements.length;am++){
        if(D.layout.right.elements[am].name=="fullscreen"){
            D.layout.right.elements.splice(am,1)
            }
        }
    o()
}
al(D.layout.left);
al(D.layout.center);
al(D.layout.right)
}
function al(ap,am){
    var aq=ap.position=="right"?"right":"left";
    var ao=_utils.extend([],ap.elements);
    if(_utils.exists(am)){
        ao.reverse()
        }
        var ap=ac(ap.position+"Group",R.elements,{
        "float":"left",
        styleFloat:"left",
        cssFloat:"left",
        height:"100%"
    });
    for(var an=0;an<ao.length;an++){
        C(ao[an],aq,ap)
        }
    }
    function L(){
    return Q++
    }
    function C(aq,at,av){
    var ap,an,ao,am,aw;
    if(!av){
        av=R.elements
        }
        if(aq.type=="divider"){
        y("divider"+L(),at,true,av,undefined,aq.width,aq.element);
        return
    }
    switch(aq.name){
        case"play":
            y("playButton",at,false,av);
            y("pauseButton",at,true,av);
            T("playButton","jwPlay");
            T("pauseButton","jwPause");
            break;
        case"prev":
            y("prevButton",at,true,av);
            T("prevButton","jwPlaylistPrev");
            break;
        case"stop":
            y("stopButton",at,true,av);
            T("stopButton","jwStop");
            break;
        case"next":
            y("nextButton",at,true,av);
            T("nextButton","jwPlaylistNext");
            break;
        case"elapsed":
            y("elapsedText",at,true,av);
            break;
        case"time":
            an=!_utils.exists(l.skin.getSkinElement("controlbar","timeSliderCapLeft"))?0:l.skin.getSkinElement("controlbar","timeSliderCapLeft").width;
            ao=!_utils.exists(l.skin.getSkinElement("controlbar","timeSliderCapRight"))?0:l.skin.getSkinElement("controlbar","timeSliderCapRight").width;
            ap=at=="left"?an:ao;
            aw={
            height:K().height,
            position:"relative",
            "float":"left",
            styleFloat:"left",
            cssFloat:"left"
        };
        
        var ar=ac("timeSlider",av,aw);
            y("timeSliderCapLeft",at,true,ar,"relative");
            y("timeSliderRail",at,false,ar,"relative");
            y("timeSliderBuffer",at,false,ar,"absolute");
            y("timeSliderProgress",at,false,ar,"absolute");
            y("timeSliderThumb",at,false,ar,"absolute");
            y("timeSliderCapRight",at,true,ar,"relative");
            aa("time");
            break;
        case"fullscreen":
            y("fullscreenButton",at,false,av);
            y("normalscreenButton",at,true,av);
            T("fullscreenButton","jwSetFullscreen",true);
            T("normalscreenButton","jwSetFullscreen",false);
            break;
        case"volume":
            an=!_utils.exists(l.skin.getSkinElement("controlbar","volumeSliderCapLeft"))?0:l.skin.getSkinElement("controlbar","volumeSliderCapLeft").width;
            ao=!_utils.exists(l.skin.getSkinElement("controlbar","volumeSliderCapRight"))?0:l.skin.getSkinElement("controlbar","volumeSliderCapRight").width;
            ap=at=="left"?an:ao;
            am=l.skin.getSkinElement("controlbar","volumeSliderRail").width+an+ao;
            aw={
            height:K().height,
            position:"relative",
            width:am,
            "float":"left",
            styleFloat:"left",
            cssFloat:"left"
        };
        
        var au=ac("volumeSlider",av,aw);
            y("volumeSliderCapLeft",at,false,au,"relative");
            y("volumeSliderRail",at,false,au,"relative");
            y("volumeSliderProgress",at,false,au,"absolute");
            y("volumeSliderThumb",at,false,au,"absolute");
            y("volumeSliderCapRight",at,false,au,"relative");
            aa("volume");
            break;
        case"mute":
            y("muteButton",at,false,av);
            y("unmuteButton",at,true,av);
            T("muteButton","jwSetMute",true);
            T("unmuteButton","jwSetMute",false);
            break;
        case"duration":
            y("durationText",at,true,av);
            break
            }
        }
function y(ap,at,an,aw,aq,am,ao){
    if(_utils.exists(l.skin.getSkinElement("controlbar",ap))||ap.indexOf("Text")>0||ap.indexOf("divider")===0){
        var ar={
            height:"100%",
            position:aq?aq:"relative",
            display:"block",
            "float":"left",
            styleFloat:"left",
            cssFloat:"left"
        };
        
        if((ap.indexOf("next")===0||ap.indexOf("prev")===0)&&(l.jwGetPlaylist().length<2||D.hideplaylistcontrols)){
            an=false;
            ar.display="none"
            }
            var ax;
        if(ap.indexOf("Text")>0){
            ap.innerhtml="00:00";
            ar.font=D.fontsize+"px/"+(K().height+1)+"px "+D.font;
            ar.color=D.fontcolor;
            ar.textAlign="center";
            ar.fontWeight=D.fontweight;
            ar.fontStyle=D.fontstyle;
            ar.cursor="default";
            ax=14+3*D.fontsize
            }else{
            if(ap.indexOf("divider")===0){
                if(am){
                    if(!isNaN(parseInt(am))){
                        ax=parseInt(am)
                        }
                    }else{
                if(ao){
                    var au=l.skin.getSkinElement("controlbar",ao);
                    if(au){
                        ar.background="url("+au.src+") repeat-x center left";
                        ax=au.width
                        }
                    }else{
                ar.background="url("+l.skin.getSkinElement("controlbar","divider").src+") repeat-x center left";
                ax=l.skin.getSkinElement("controlbar","divider").width
                }
            }
    }else{
    ar.background="url("+l.skin.getSkinElement("controlbar",ap).src+") repeat-x center left";
    ax=l.skin.getSkinElement("controlbar",ap).width
    }
}
if(at=="left"){
    if(an){
        ae+=ax
        }
    }else{
    if(at=="right"){
        if(an){
            E+=ax
            }
        }
}
if(_utils.typeOf(aw)=="undefined"){
    aw=R.elements
    }
    ar.width=ax;
if(q){
    _css(R[ap],ar)
    }else{
    var av=ac(ap,aw,ar);
    if(_utils.exists(l.skin.getSkinElement("controlbar",ap+"Over"))){
        av.onmouseover=function(ay){
            av.style.backgroundImage=["url(",l.skin.getSkinElement("controlbar",ap+"Over").src,")"].join("")
            };
            
        av.onmouseout=function(ay){
            av.style.backgroundImage=["url(",l.skin.getSkinElement("controlbar",ap).src,")"].join("")
            }
        }
    if(ap.indexOf("divider")==0){
    av.setAttribute("class","divider")
    }
}
}
}
function F(){
    l.jwAddEventListener(a.api.events.JWPLAYER_PLAYLIST_LOADED,B);
    l.jwAddEventListener(a.api.events.JWPLAYER_PLAYLIST_ITEM,t);
    l.jwAddEventListener(a.api.events.JWPLAYER_MEDIA_BUFFER,v);
    l.jwAddEventListener(a.api.events.JWPLAYER_PLAYER_STATE,s);
    l.jwAddEventListener(a.api.events.JWPLAYER_MEDIA_TIME,J);
    l.jwAddEventListener(a.api.events.JWPLAYER_MEDIA_MUTE,ak);
    l.jwAddEventListener(a.api.events.JWPLAYER_MEDIA_VOLUME,n);
    l.jwAddEventListener(a.api.events.JWPLAYER_MEDIA_COMPLETE,M)
    }
    function B(){
    if(!D.hideplaylistcontrols){
        if(l.jwGetPlaylist().length>1){
            _show(R.nextButton);
            _show(R.prevButton)
            }else{
            _hide(R.nextButton);
            _hide(R.prevButton)
            }
            x();
        ah()
        }
    }
function t(am){
    ag=l.jwGetPlaylist()[am.index].duration;
    J({
        id:l.id,
        duration:ag,
        position:0
    });
    v({
        id:l.id,
        bufferProgress:0
    })
    }
    function ah(){
    J({
        id:l.id,
        duration:l.jwGetDuration(),
        position:0
    });
    v({
        id:l.id,
        bufferProgress:0
    });
    ak({
        id:l.id,
        mute:l.jwGetMute()
        });
    s({
        id:l.id,
        newstate:a.api.events.state.IDLE
        });
    n({
        id:l.id,
        volume:l.jwGetVolume()
        })
    }
    function T(ao,ap,an){
    if(q){
        return
    }
    if(_utils.exists(l.skin.getSkinElement("controlbar",ao))){
        var am=R[ao];
        if(_utils.exists(am)){
            _css(am,{
                cursor:"pointer"
            });
            if(ap=="fullscreen"){
                am.onmouseup=function(aq){
                    aq.stopPropagation();
                    l.jwSetFullscreen(!l.jwGetFullscreen())
                    }
                }else{
            am.onmouseup=function(aq){
                aq.stopPropagation();
                if(_utils.exists(an)){
                    l[ap](an)
                    }else{
                    l[ap]()
                    }
                }
        }
}
}
}
function aa(am){
    if(q){
        return
    }
    var an=R[am+"Slider"];
    _css(R.elements,{
        cursor:"pointer"
    });
    _css(an,{
        cursor:"pointer"
    });
    an.onmousedown=function(ao){
        w=am
        };
        
    an.onmouseup=function(ao){
        ao.stopPropagation();
        aj(ao.pageX)
        };
        
    an.onmousemove=function(ao){
        if(w=="time"){
            h=true;
            var ap=ao.pageX-c[am+"Slider"].left-window.pageXOffset;
            _css(R[w+"SliderThumb"],{
                left:ap
            })
            }
        }
}
function aj(an){
    h=false;
    var am;
    if(w=="time"){
        am=an-c.timeSliderRail.left+window.pageXOffset;
        var ap=am/c.timeSliderRail.width*ag;
        if(ap<0){
            ap=0
            }else{
            if(ap>ag){
                ap=ag-3
                }
            }
        if(l.jwGetState()==a.api.events.state.PAUSED||l.jwGetState()==a.api.events.state.IDLE){
        l.jwPlay()
        }
        l.jwSeek(ap)
    }else{
    if(w=="volume"){
        am=an-c.volumeSliderRail.left-window.pageXOffset;
        var ao=Math.round(am/c.volumeSliderRail.width*100);
        if(ao<0){
            ao=0
            }else{
            if(ao>100){
                ao=100
                }
            }
        if(l.jwGetMute()){
        l.jwSetMute(false)
        }
        l.jwSetVolume(ao)
    }
}
w="none"
}
function v(an){
    if(_utils.exists(an.bufferPercent)){
        g=an.bufferPercent
        }
        if(c.timeSliderRail){
        var ap=l.skin.getSkinElement("controlbar","timeSliderCapLeft");
        var ao=c.timeSliderRail.width;
        var am=isNaN(Math.round(ao*g/100))?0:Math.round(ao*g/100);
        _css(R.timeSliderBuffer,{
            width:am,
            left:ap?ap.width:0
            })
        }
    }
function ak(am){
    if(am.mute){
        _hide(R.muteButton);
        _show(R.unmuteButton);
        _hide(R.volumeSliderProgress)
        }else{
        _show(R.muteButton);
        _hide(R.unmuteButton);
        _show(R.volumeSliderProgress)
        }
    }
function s(am){
    if(am.newstate==a.api.events.state.BUFFERING||am.newstate==a.api.events.state.PLAYING){
        _show(R.pauseButton);
        _hide(R.playButton)
        }else{
        _hide(R.pauseButton);
        _show(R.playButton)
        }
        Y();
    if(am.newstate==a.api.events.state.IDLE){
        _hide(R.timeSliderBuffer);
        _hide(R.timeSliderProgress);
        _hide(R.timeSliderThumb);
        J({
            id:l.id,
            duration:l.jwGetDuration(),
            position:0
        })
        }else{
        _show(R.timeSliderBuffer);
        if(am.newstate!=a.api.events.state.BUFFERING){
            _show(R.timeSliderProgress);
            _show(R.timeSliderThumb)
            }
        }
}
function M(am){
    v({
        bufferPercent:0
    });
    J(_utils.extend(am,{
        position:0,
        duration:ag
    }))
    }
    function J(ap){
    if(_utils.exists(ap.position)){
        k=ap.position
        }
        if(_utils.exists(ap.duration)){
        ag=ap.duration
        }
        var an=(k===ag===0)?0:k/ag;
    var ar=c.timeSliderRail;
    if(ar){
        var am=isNaN(Math.round(ar.width*an))?0:Math.round(ar.width*an);
        var aq=l.skin.getSkinElement("controlbar","timeSliderCapLeft");
        var ao=am+(aq?aq.width:0);
        if(R.timeSliderProgress){
            _css(R.timeSliderProgress,{
                width:am,
                left:aq?aq.width:0
                });
            if(!h){
                if(R.timeSliderThumb){
                    R.timeSliderThumb.style.left=ao+"px"
                    }
                }
        }
}
if(R.durationText){
    R.durationText.innerHTML=_utils.timeFormat(ag)
    }
    if(R.elapsedText){
    R.elapsedText.innerHTML=_utils.timeFormat(k)
    }
}
function o(){
    var am=R.elements.childNodes;
    var ar,ap;
    for(var ao=0;ao<am.length;ao++){
        var aq=am[ao].childNodes;
        for(var an in aq){
            if(isNaN(parseInt(an,10))){
                continue
            }
            if(aq[an].id.indexOf(af.id+"_divider")===0&&ap&&ap.id.indexOf(af.id+"_divider")===0&&aq[an].style.backgroundImage==ap.style.backgroundImage){
                aq[an].style.display="none"
                }else{
                if(aq[an].id.indexOf(af.id+"_divider")===0&&ar&&ar.style.display!="none"){
                    aq[an].style.display="block"
                    }
                }
            if(aq[an].style.display!="none"){
            ap=aq[an]
            }
            ar=aq[an]
        }
        }
    }
function ai(){
    if(l.jwGetFullscreen()){
        _show(R.normalscreenButton);
        _hide(R.fullscreenButton)
        }else{
        _hide(R.normalscreenButton);
        _show(R.fullscreenButton)
        }
        if(l.jwGetState()==a.api.events.state.BUFFERING||l.jwGetState()==a.api.events.state.PLAYING){
        _show(R.pauseButton);
        _hide(R.playButton)
        }else{
        _hide(R.pauseButton);
        _show(R.playButton)
        }
        if(l.jwGetMute()==true){
        _hide(R.muteButton);
        _show(R.unmuteButton)
        }else{
        _show(R.muteButton);
        _hide(R.unmuteButton)
        }
    }
function x(){
    o();
    ai();
    var ao={
        width:f
    };
    
    var aw={
        "float":"left",
        styleFloat:"left",
        cssFloat:"left"
    };
    
    if(D.position==a.html5.view.positions.OVER||l.jwGetFullscreen()){
        ao.left=D.margin;
        ao.width-=2*D.margin;
        ao.top=z-K().height-D.margin;
        ao.height=K().height
        }
        var aq=l.skin.getSkinElement("controlbar","capLeft");
    var au=l.skin.getSkinElement("controlbar","capRight");
    aw.width=ao.width-(aq?aq.width:0)-(au?au.width:0);
    var ap=_utils.getBoundingClientRect(R.leftGroup).width;
    var at=_utils.getBoundingClientRect(R.rightGroup).width;
    var ar=aw.width-ap-at;
    var an=ar;
    var am=l.skin.getSkinElement("controlbar","timeSliderCapLeft");
    var av=l.skin.getSkinElement("controlbar","timeSliderCapRight");
    if(_utils.exists(am)){
        an-=am.width
        }
        if(_utils.exists(av)){
        an-=av.width
        }
        R.timeSlider.style.width=ar+"px";
    R.timeSliderRail.style.width=an+"px";
    _css(af,ao);
    _css(R.elements,aw);
    _css(R.background,aw);
    r();
    return ao
    }
    function n(ar){
    if(_utils.exists(R.volumeSliderRail)){
        var ao=isNaN(ar.volume/100)?1:ar.volume/100;
        var ap=_utils.parseDimension(R.volumeSliderRail.style.width);
        var am=isNaN(Math.round(ap*ao))?0:Math.round(ap*ao);
        var at=_utils.parseDimension(R.volumeSliderRail.style.right);
        var an=(!_utils.exists(l.skin.getSkinElement("controlbar","volumeSliderCapLeft")))?0:l.skin.getSkinElement("controlbar","volumeSliderCapLeft").width;
        _css(R.volumeSliderProgress,{
            width:am,
            left:an
        });
        if(R.volumeSliderThumb){
            var aq=(am-Math.round(_utils.parseDimension(R.volumeSliderThumb.style.width)/2));
            aq=Math.min(Math.max(aq,0),ap-_utils.parseDimension(R.volumeSliderThumb.style.width));
            _css(R.volumeSliderThumb,{
                left:aq
            })
            }
            if(_utils.exists(R.volumeSliderCapLeft)){
            _css(R.volumeSliderCapLeft,{
                left:0
            })
            }
        }
}
function S(){
    H=document.getElementById(l.id);
    H.addEventListener("mousemove",Y)
    }
    function u(){
    O();
    N();
    r();
    q=true;
    F();
    D.idlehide=(D.idlehide.toString().toLowerCase()=="true");
    if(D.position==a.html5.view.positions.OVER&&D.idlehide){
        af.style.opacity=0;
        U=true
        }else{
        af.style.opacity=1;
        setTimeout((function(){
            U=true;
            V()
            }),1)
        }
        S();
    ah()
    }
    u();
return this
}
})(jwplayer);
(function(b){
    var a=["width","height","state","playlist","item","position","buffer","duration","volume","mute","fullscreen"];
    var c=b.utils;
    b.html5.controller=function(n,I,e,g){
        var m=n;
        var k=e;
        var h=g;
        var x=I;
        var K=true;
        var E=-1;
        var z=c.exists(k.config.debug)&&(k.config.debug.toString().toLowerCase()=="console");
        var L=new b.html5.eventdispatcher(x.id,z);
        c.extend(this,L);
        var B=[];
        var p=false;
        function J(Q){
            if(p){
                L.sendEvent(Q.type,Q)
                }else{
                B.push(Q)
                }
            }
        function r(Q){
        if(!p){
            p=true;
            L.sendEvent(b.api.events.JWPLAYER_READY,Q);
            if(b.utils.exists(window.playerReady)){
                playerReady(Q)
                }
                if(b.utils.exists(window[e.config.playerReady])){
                window[e.config.playerReady](Q)
                }while(B.length>0){
                var S=B.shift();
                L.sendEvent(S.type,S)
                }
                if(e.config.autostart&&!b.utils.isIOS()){
                M()
                }while(w.length>0){
                var R=w.shift();
                A(R.method,R.arguments)
                }
            }
    }
k.addGlobalListener(J);
    k.addEventListener(b.api.events.JWPLAYER_MEDIA_BUFFER_FULL,function(){
    k.getMedia().play()
    });
k.addEventListener(b.api.events.JWPLAYER_MEDIA_TIME,function(Q){
    if(Q.position>=k.playlist[k.item].start&&E>=0){
        k.playlist[k.item].start=E;
        E=-1
        }
    });
k.addEventListener(b.api.events.JWPLAYER_MEDIA_COMPLETE,function(Q){
    setTimeout(C,25)
    });
k.addEventListener(b.api.events.JWPLAYER_PLAYLIST_LOADED,M);
k.addEventListener(b.api.events.JWPLAYER_FULLSCREEN,o);
function D(){
    try{
        u(k.item);
        if(k.playlist[k.item].levels[0].file.length>0){
            if(K||k.state==b.api.events.state.IDLE){
                k.getMedia().load(k.playlist[k.item]);
                K=false
                }else{
                if(k.state==b.api.events.state.PAUSED){
                    k.getMedia().play()
                    }
                }
        }
    return true
}catch(Q){
    L.sendEvent(b.api.events.JWPLAYER_ERROR,Q)
    }
    return false
}
function d(){
    try{
        if(k.playlist[k.item].levels[0].file.length>0){
            switch(k.state){
                case b.api.events.state.PLAYING:case b.api.events.state.BUFFERING:
                    if(k.getMedia()){
                    k.getMedia().pause()
                    }
                    break
                }
                }
        return true
    }catch(Q){
    L.sendEvent(b.api.events.JWPLAYER_ERROR,Q)
    }
    return false
}
function y(Q){
    try{
        if(k.playlist[k.item].levels[0].file.length>0){
            if(typeof Q!="number"){
                Q=parseFloat(Q)
                }
                switch(k.state){
                case b.api.events.state.IDLE:
                    if(E<0){
                    E=k.playlist[k.item].start;
                    k.playlist[k.item].start=Q
                    }
                    D();
                    break;
                case b.api.events.state.PLAYING:case b.api.events.state.PAUSED:case b.api.events.state.BUFFERING:
                    k.seek(Q);
                    break
                    }
                }
        return true
    }catch(R){
    L.sendEvent(b.api.events.JWPLAYER_ERROR,R)
    }
    return false
}
function v(Q){
    if(!c.exists(Q)){
        Q=true
        }
        try{
        if(k.getMedia()){
            k.getMedia().stop(Q)
            }
            return true
        }catch(R){
        L.sendEvent(b.api.events.JWPLAYER_ERROR,R)
        }
        return false
    }
    function j(){
    try{
        if(k.playlist[k.item].levels[0].file.length>0){
            if(k.config.shuffle){
                u(P())
                }else{
                if(k.item+1==k.playlist.length){
                    u(0)
                    }else{
                    u(k.item+1)
                    }
                }
        }
    if(k.state!=b.api.events.state.IDLE){
    var R=k.state;
    k.state=b.api.events.state.IDLE;
    L.sendEvent(b.api.events.JWPLAYER_PLAYER_STATE,{
        oldstate:R,
        newstate:b.api.events.state.IDLE
        })
    }
    D();
return true
}catch(Q){
    L.sendEvent(b.api.events.JWPLAYER_ERROR,Q)
    }
    return false
}
function G(){
    try{
        if(k.playlist[k.item].levels[0].file.length>0){
            if(k.config.shuffle){
                u(P())
                }else{
                if(k.item===0){
                    u(k.playlist.length-1)
                    }else{
                    u(k.item-1)
                    }
                }
        }
    if(k.state!=b.api.events.state.IDLE){
    var R=k.state;
    k.state=b.api.events.state.IDLE;
    L.sendEvent(b.api.events.JWPLAYER_PLAYER_STATE,{
        oldstate:R,
        newstate:b.api.events.state.IDLE
        })
    }
    D();
return true
}catch(Q){
    L.sendEvent(b.api.events.JWPLAYER_ERROR,Q)
    }
    return false
}
function P(){
    var Q=null;
    if(k.playlist.length>1){
        while(!c.exists(Q)){
            Q=Math.floor(Math.random()*k.playlist.length);
            if(Q==k.item){
                Q=null
                }
            }
    }else{
    Q=0
    }
    return Q
}
function F(R){
    if(!k.playlist||!k.playlist[R]){
        return false
        }
        try{
        if(k.playlist[R].levels[0].file.length>0){
            var S=k.state;
            if(S!==b.api.events.state.IDLE){
                if(k.playlist[k.item].provider==k.playlist[R].provider){
                    v(false)
                    }else{
                    v()
                    }
                }
            u(R);
        D()
        }
        return true
    }catch(Q){
    L.sendEvent(b.api.events.JWPLAYER_ERROR,Q)
    }
    return false
}
function u(Q){
    if(!k.playlist[Q]){
        return
    }
    k.setActiveMediaProvider(k.playlist[Q]);
    if(k.item!=Q){
        k.item=Q;
        K=true;
        L.sendEvent(b.api.events.JWPLAYER_PLAYLIST_ITEM,{
            index:Q
        })
        }
    }
function f(R){
    try{
        u(k.item);
        var S=k.getMedia();
        switch(typeof(R)){
            case"number":
                S.volume(R);
                break;
            case"string":
                S.volume(parseInt(R,10));
                break
                }
                return true
        }catch(Q){
        L.sendEvent(b.api.events.JWPLAYER_ERROR,Q)
        }
        return false
    }
    function q(R){
    try{
        u(k.item);
        var S=k.getMedia();
        if(typeof R=="undefined"){
            S.mute(!k.mute)
            }else{
            if(R.toString().toLowerCase()=="true"){
                S.mute(true)
                }else{
                S.mute(false)
                }
            }
        return true
    }catch(Q){
    L.sendEvent(b.api.events.JWPLAYER_ERROR,Q)
    }
    return false
}
function H(R,Q){
    try{
        k.width=R;
        k.height=Q;
        h.resize(R,Q);
        L.sendEvent(b.api.events.JWPLAYER_RESIZE,{
            width:k.width,
            height:k.height
            });
        return true
        }catch(S){
        L.sendEvent(b.api.events.JWPLAYER_ERROR,S)
        }
        return false
    }
    function t(R){
    try{
        if(typeof R=="undefined"){
            R=!k.fullscreen
            }
            if(R!=k.fullscreen){
            if(R.toString().toLowerCase()=="true"){
                k.fullscreen=true;
                h.fullscreen(true);
                L.sendEvent(b.api.events.JWPLAYER_FULLSCREEN,{
                    fullscreen:true
                })
                }else{
                k.fullscreen=false;
                h.fullscreen(false);
                L.sendEvent(b.api.events.JWPLAYER_FULLSCREEN,{
                    fullscreen:false
                })
                }
                L.sendEvent(b.api.events.JWPLAYER_RESIZE,{
                width:k.width,
                height:k.height
                })
            }
            return true
        }catch(Q){
        L.sendEvent(b.api.events.JWPLAYER_ERROR,Q)
        }
        return false
    }
    function O(Q){
    try{
        v();
        k.loadPlaylist(Q);
        if(k.playlist[k.item].provider){
            u(k.item);
            if(k.config.autostart.toString().toLowerCase()=="true"){
                D()
                }
                return true
            }else{
            return false
            }
        }catch(R){
    L.sendEvent(b.api.events.JWPLAYER_ERROR,R)
    }
    return false
}
function M(Q){
    u(k.playlist[k.item]);
    if(k.config.autostart.toString().toLowerCase()=="true"){
        D()
        }
    }
function o(Q){
    t(Q.fullscreen)
    }
    function s(){
    try{
        return k.getMedia().detachMedia()
        }catch(Q){
        return null
        }
    }
function l(){
    try{
        return k.getMedia().attachMedia()
        }catch(Q){
        return null
        }
    }
b.html5.controller.repeatoptions={
    LIST:"LIST",
    ALWAYS:"ALWAYS",
    SINGLE:"SINGLE",
    NONE:"NONE"
};

function C(){
    switch(k.config.repeat.toUpperCase()){
        case b.html5.controller.repeatoptions.SINGLE:
            D();
            break;
        case b.html5.controller.repeatoptions.ALWAYS:
            if(k.item==k.playlist.length-1&&!k.config.shuffle){
            F(0)
            }else{
            j()
            }
            break;
        case b.html5.controller.repeatoptions.LIST:
            if(k.item==k.playlist.length-1&&!k.config.shuffle){
            v();
            u(0)
            }else{
            j()
            }
            break;
        default:
            v();
            break
            }
        }
var w=[];
function N(Q){
    return function(){
        if(p){
            A(Q,arguments)
            }else{
            w.push({
                method:Q,
                arguments:arguments
            })
            }
        }
}
function A(S,R){
    var Q=[];
    for(i=0;i<R.length;i++){
        Q.push(R[i])
        }
        S.apply(this,Q)
    }
    this.play=N(D);
this.pause=N(d);
this.seek=N(y);
this.stop=N(v);
this.next=N(j);
this.prev=N(G);
this.item=N(F);
this.setVolume=N(f);
this.setMute=N(q);
this.resize=N(H);
this.setFullscreen=N(t);
this.load=N(O);
this.playerReady=r;
this.detachMedia=s;
this.attachMedia=l
}
})(jwplayer);
(function(a){
    a.html5.defaultSkin=function(){
        this.text='<?xml version="1.0" ?><skin author="LongTail Video" name="Five" version="1.1"><components><component name="controlbar"><settings><setting name="margin" value="20"/><setting name="fontsize" value="11"/><setting name="fontcolor" value="0x000000"/></settings><layout><group position="left"><button name="play"/><divider name="divider"/><button name="prev"/><divider name="divider"/><button name="next"/><divider name="divider"/><text name="elapsed"/></group><group position="center"><slider name="time"/></group><group position="right"><text name="duration"/><divider name="divider"/><button name="blank"/><divider name="divider"/><button name="mute"/><slider name="volume"/><divider name="divider"/><button name="fullscreen"/></group></layout><elements><element name="background" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAIAAABvFaqvAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAElJREFUOI3t1LERACAMQlFgGvcfxNIhHMK4gsUvUviOmgtNsiAZkBSEKxKEnCYkkQrJn/YwbUNiSDDYRZaQRDaShv+oX9GBZEIuK+8hXVLs+/YAAAAASUVORK5CYII="/><element name="blankButton" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAYCAYAAAAyJzegAAAAFElEQVQYV2P8//8/AzpgHBUc7oIAGZdH0RjKN8EAAAAASUVORK5CYII="/><element name="capLeft" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAYCAYAAAA7zJfaAAAAQElEQVQIWz3LsRGAMADDQJ0XB5bMINABZ9GENGrszxhjT2WLSqxEJG2JQrTMdV2q5LpOAvyRaVmsi7WdeZ/7+AAaOTq7BVrfOQAAAABJRU5ErkJggg=="/><element name="capRight" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAYCAYAAAA7zJfaAAAAQElEQVQIWz3LsRGAMADDQJ0XB5bMINABZ9GENGrszxhjT2WLSqxEJG2JQrTMdV2q5LpOAvyRaVmsi7WdeZ/7+AAaOTq7BVrfOQAAAABJRU5ErkJggg=="/><element name="divider" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAYCAIAAAC0rgCNAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAADhJREFUCB0FwcENgEAAw7Aq+893g8APUILNOQcbFRktVGqUVFRkWNz3xTa2sUaLNUosKlRUvvf5AdbWOTtzmzyWAAAAAElFTkSuQmCC"/><element name="playButton" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAYCAYAAAAVibZIAAAANUlEQVR42u2RsQkAAAjD/NTTPaW6dXLrINJA1kBpGPMAjDWmOgp1HFQXx+b1KOefO4oxY57R73YnVYCQUCQAAAAASUVORK5CYII="/><element name="pauseButton" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAYCAYAAAAVibZIAAAAIUlEQVQ4jWNgGAWjYOiD/0gYG3/U0FFDB4Oho2AUDAYAAEwiL9HrpdMVAAAAAElFTkSuQmCC"/><element name="prevButton" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAYCAYAAAAVibZIAAAAQklEQVQ4y2NgGAWjYOiD/1AMA/JAfB5NjCJD/YH4PRaLyDa0H4lNNUP/DxlD59PCUBCIp3ZEwYA+NZLUKBgFgwEAAN+HLX9sB8u8AAAAAElFTkSuQmCC"/><element name="nextButton" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAYCAYAAAAVibZIAAAAQElEQVQ4y2NgGAWjYOiD/0B8Hojl0cT+U2ooCL8HYn9qGwrD/bQw9P+QMXQ+tSMqnpoRBUpS+tRMUqNgFAwGAADxZy1/mHvFnAAAAABJRU5ErkJggg=="/><element name="timeSliderRail" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAOElEQVRIDe3BwQkAIRADwAhhw/nU/kWwUK+KPITMABFh19Y+F0acY8CJvX9wYpXgRElwolSIiMf9ZWEDhtwurFsAAAAASUVORK5CYII="/><element name="timeSliderBuffer" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAN0lEQVRIDe3BwQkAMQwDMBcc55mRe9zi7RR+FCwBEWG39vcfGHFm4MTuhhMlwYlVBSdKhYh43AW/LQMKm1spzwAAAABJRU5ErkJggg=="/><element name="timeSliderProgress" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAIElEQVRIiWNgGAWjYBTQBfynMR61YCRYMApGwSigMQAAiVWPcbq6UkIAAAAASUVORK5CYII="/><element name="timeSliderThumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAMAAAAYCAYAAAA/OUfnAAAAO0lEQVQYlWP4//8/Awwz0JgDBP/BeN6Cxf/hnI2btiI4u/fsQ3AOHjqK4Jw4eQbBOX/hEoKDYjSd/AMA4cS4mfLsorgAAAAASUVORK5CYII="/><element name="muteButton" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAYCAYAAADKx8xXAAAAJklEQVQ4y2NgGAUjDcwH4v/kaPxPikZkxcNVI9mBQ5XoGAWDFwAAsKAXKQQmfbUAAAAASUVORK5CYII="/><element name="unmuteButton" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAYCAYAAADKx8xXAAAAMklEQVQ4y2NgGAWDHPyntub5xBr6Hwv/Pzk2/yfVG/8psRFE25Oq8T+tQnsIaB4FVAcAi2YVysVY52AAAAAASUVORK5CYII="/><element name="volumeSliderRail" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYAgMAAACdGdVrAAAACVBMVEUAAACmpqampqbBXAu8AAAAAnRSTlMAgJsrThgAAAArSURBVAhbY2AgErBAyA4I2QEhOyBkB4TsYOhAoaCCUCUwDTDtMMNgRuMHAFB5FoGH5T0UAAAAAElFTkSuQmCC"/><element name="volumeSliderProgress" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYAgMAAACdGdVrAAAACVBMVEUAAAAAAAAAAACDY+nAAAAAAnRSTlMAgJsrThgAAAArSURBVAhbY2AgErBAyA4I2QEhOyBkB4TsYOhAoaCCUCUwDTDtMMNgRuMHAFB5FoGH5T0UAAAAAElFTkSuQmCC"/><element name="volumeSliderCapRight" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAYCAYAAAAyJzegAAAAFElEQVQYV2P8//8/AzpgHBUc7oIAGZdH0RjKN8EAAAAASUVORK5CYII="/><element name="fullscreenButton" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAQklEQVRIiWNgGAWjYMiD/0iYFDmSLbDHImdPLQtgBpEiR7Zl2NijAA5oEkT/0Whi5UiyAJ8BVMsHNMtoo2AUDAIAAGdcIN3IDNXoAAAAAElFTkSuQmCC"/><element name="normalscreenButton" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAP0lEQVRIx2NgGAWjYMiD/1RSQ5QB/wmIUWzJfzx8qhj+n4DYCAY0DyJ7PBbYU8sHMEvwiZFtODXUjIJRMJgBACpWIN2ZxdPTAAAAAElFTkSuQmCC"/></elements></component><component name="display"><elements><element name="background" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyAQMAAAAk8RryAAAABlBMVEUAAAAAAAClZ7nPAAAAAnRSTlOZpuml+rYAAAASSURBVBhXY2AYJuA/GBwY6jQAyDyoK8QcL4QAAAAASUVORK5CYII="/><element name="playIcon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAiUlEQVR42u3XSw2AMBREURwgAQlIQAISKgUpSEFKJeCg5b0E0kWBTVcD9ySTsL0Jn9IBAAAA+K2UUrBlW/Rr5ZDoIeeuoFkxJD9ss03aIXXQqB9SttoG7ZA6qNcOKdttiwcJh9RB+iFl4SshkRBuLR72+9cvH0SOKI2HRo7x/Fi1/uoCAAAAwLsD8ki99IlO2dQAAAAASUVORK5CYII="/><element name="muteIcon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAVUlEQVR42u3WMQrAIAxAUW/g/SdvGmvpoOBeSHgPsjj5QTANAACARCJilIhYM0tEvJM+Ik3Id9E957kQIb+F3OdCPC0hPkQriqWx9hp/x/QGAABQyAPLB22VGrpLDgAAAABJRU5ErkJggg=="/><element name="errorIcon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAA/0lEQVR42u2U0QmEMBAF7cASLMESUoIlpARLSCkpwRJSgiWkhOvAXD4WsgRkyaG5DbyB+Yvg8KITAAAAAAAYk+u61mwk15EjPtlEfihmqIiZR1Qx80ghjgdUuiHXGHSVsoag0x6x8DUoyjD5KovmEJ9NTDMRPIT0mtdIUkjlonuNohO+Ha99DTmkuGgKCTcvebAzx82ZoCWC3/3aIMWSRucaxcjORSFY4xpFdjYJGp1rFGcyCYZ/RVh6AUnfcNZ2zih3/mGj1jVCdiNDwyrq1rA/xMdeEXvDVdnYc1vDc3uPkDObXrlaxbNHSOohQhr/WOeLEWfWTgAAAAAAADzNF9sHJ7PJ57MlAAAAAElFTkSuQmCC"/><element name="bufferIcon" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAACBklEQVR42u3Zv0sCYRzH8USTzOsHHEWGkC1HgaDgkktGDjUYtDQ01RDSljQ1BLU02+rk1NTm2NLq4Nx/0L/h9fnCd3j4cnZe1/U8xiO8h3uurufF0/3COd/3/0UWYiEWYiEWYiGJQ+J8xuPxKhXjEMZANinjIZhkGuVRNioE4wVURo4JkHm0xKWmhRAc1bh1EyCUw5BcBIjHiApKa4CErko6DEJwuRo6IRKzyJD8FJAyI3Zp2zRImiBcRhlfo5RtlxCcE3CcDNpGrhYIT2IhAJKilO0VRmzJ32fAMTpBTS0QMfGwlcuKMRftE0DJ0wCJdcOsCkBdXP3Mh9CEFUBTPS9mDZJBG6io4aqVzMdCokCw9H3kT6j/C/9iDdSeUMNC7DkyyxAs/Rk6Qss8FPWRZgdVtUH4DjxEn1zxh+/zj1wHlf4MQhNGrwqA6sY40U8JonRJwEQh+AO3AvCG6gHv4U7IY4krxkroWoAOkoQMGfCBrgIm+YBGqPENpIJ66CJg3x66Y0gnSUidAEEnNr9jjLiWMn5DiWP0OC/oAsCgkq43xBdGDMQr7YASP/vEkHvdl1+JOCcEV5sC4hGEOzTlPuKgd0b0xD4JkRcOgnRRTjdErkYhAsQVq6IdUuPJtmk7BCL3t/h88cx91pKQkI/pkDx6pmYTIjEoxiHsN1YWYiEWYiEWknhflZ5IErA5nr8AAAAASUVORK5CYII="/></elements></component><component name="dock"><settings><setting name="fontcolor" value="0xffffff"/></settings><elements><element name="button" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyAQMAAAAk8RryAAAABlBMVEUAAAAAAAClZ7nPAAAAAnRSTlOZpuml+rYAAAASSURBVBhXY2AYJuA/GBwY6jQAyDyoK8QcL4QAAAAASUVORK5CYII="/></elements></component><component name="playlist"><settings><setting name="backgroundcolor" value="0xe8e8e8"/></settings><elements><element name="item" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAA8CAIAAAC1nk4lAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAHBJREFUaN7t2MENwCAMBEEe9N8wSKYC/D8YV7CyJoRkVtVImxkZPQInMxoP0XiIxkM0HsGbjjSNBx544IEHHnjggUe/6UQeey0PIh7XTftGxKPj4eXCtLsHHh+ZxkO0Iw8PR55Ni8ZD9Hu/EAoP0dc5RRg9qeRjVF8AAAAASUVORK5CYII="/><element name="sliderCapTop" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAHCAYAAADnCQYGAAAAFUlEQVQokWP8//8/A7UB46ihI9hQAKt6FPPXhVGHAAAAAElFTkSuQmCC"/><element name="sliderRail" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAUCAYAAABiS3YzAAAAKElEQVQ4y2P4//8/Az68bNmy/+iYkB6GUUNHDR01dNTQUUNHDaXcUABUDOKhcxnsSwAAAABJRU5ErkJggg=="/><element name="sliderThumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAUCAYAAABiS3YzAAAAJUlEQVQ4T2P4//8/Ay4MBP9xYbz6Rg0dNXTU0FFDRw0dNZRyQwHH4NBa7GJsXAAAAABJRU5ErkJggg=="/><element name="sliderCapBottom" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABUAAAAHCAYAAADnCQYGAAAAFUlEQVQokWP8//8/A7UB46ihI9hQAKt6FPPXhVGHAAAAAElFTkSuQmCC"/></elements></component></components></skin>';
        this.xml=null;
        if(window.DOMParser){
            parser=new DOMParser();
            this.xml=parser.parseFromString(this.text,"text/xml")
            }else{
            this.xml=new ActiveXObject("Microsoft.XMLDOM");
            this.xml.async="false";
            this.xml.loadXML(this.text)
            }
            return this
        }
    })(jwplayer);
(function(a){
    _utils=a.utils;
    _css=_utils.css;
    _hide=function(b){
        _css(b,{
            display:"none"
        })
        };
        
    _show=function(b){
        _css(b,{
            display:"block"
        })
        };
        
    a.html5.display=function(k,H){
        var j={
            icons:true,
            showmute:false
        };
        
        var S=_utils.extend({},j,H);
        var h=k;
        var R={};
        
        var e;
        var u;
        var x;
        var P;
        var s;
        var J;
        var B;
        var K=!_utils.exists(h.skin.getComponentSettings("display").bufferrotation)?15:parseInt(h.skin.getComponentSettings("display").bufferrotation,10);
        var q=!_utils.exists(h.skin.getComponentSettings("display").bufferinterval)?100:parseInt(h.skin.getComponentSettings("display").bufferinterval,10);
        var A=-1;
        var t="";
        var L=true;
        var d;
        var g=false;
        var n=false;
        var w,N;
        var I=new a.html5.eventdispatcher();
        _utils.extend(this,I);
        var E={
            display:{
                style:{
                    cursor:"pointer",
                    top:0,
                    left:0,
                    overflow:"hidden"
                },
                click:m
            },
            display_icon:{
                style:{
                    cursor:"pointer",
                    position:"absolute",
                    top:((h.skin.getSkinElement("display","background").height-h.skin.getSkinElement("display","playIcon").height)/2),
                    left:((h.skin.getSkinElement("display","background").width-h.skin.getSkinElement("display","playIcon").width)/2),
                    border:0,
                    margin:0,
                    padding:0,
                    zIndex:3,
                    display:"none"
                }
            },
        display_iconBackground:{
            style:{
                cursor:"pointer",
                position:"absolute",
                top:((u-h.skin.getSkinElement("display","background").height)/2),
                left:((e-h.skin.getSkinElement("display","background").width)/2),
                border:0,
                backgroundImage:(["url(",h.skin.getSkinElement("display","background").src,")"]).join(""),
                width:h.skin.getSkinElement("display","background").width,
                height:h.skin.getSkinElement("display","background").height,
                margin:0,
                padding:0,
                zIndex:2,
                display:"none"
            }
        },
    display_image:{
        style:{
            display:"none",
            width:e,
            height:u,
            position:"absolute",
            cursor:"pointer",
            left:0,
            top:0,
            margin:0,
            padding:0,
            textDecoration:"none",
            zIndex:1
        }
    },
display_text:{
    style:{
        zIndex:4,
        position:"relative",
        opacity:0.8,
        backgroundColor:parseInt("000000",16),
        color:parseInt("ffffff",16),
        textAlign:"center",
        fontFamily:"Arial,sans-serif",
        padding:"0 5px",
        fontSize:14
    }
}
};

h.jwAddEventListener(a.api.events.JWPLAYER_PLAYER_STATE,o);
h.jwAddEventListener(a.api.events.JWPLAYER_MEDIA_MUTE,o);
h.jwAddEventListener(a.api.events.JWPLAYER_PLAYLIST_ITEM,o);
h.jwAddEventListener(a.api.events.JWPLAYER_ERROR,p);
M();
function M(){
    R.display=D("div","display");
    R.display_text=D("div","display_text");
    R.display.appendChild(R.display_text);
    R.display_image=D("img","display_image");
    R.display_image.onerror=function(T){
        _hide(R.display_image)
        };
        
    R.display_image.onload=z;
    R.display_icon=D("div","display_icon");
    R.display_iconBackground=D("div","display_iconBackground");
    R.display.appendChild(R.display_image);
    R.display_iconBackground.appendChild(R.display_icon);
    R.display.appendChild(R.display_iconBackground);
    f();
    setTimeout((function(){
        n=true;
        if(S.icons.toString()=="true"){
            G()
            }
        }),1)
}
this.getDisplayElement=function(){
    return R.display
    };
    
this.resize=function(U,T){
    _css(R.display,{
        width:U,
        height:T
    });
    _css(R.display_text,{
        width:(U-10),
        top:((T-_utils.getBoundingClientRect(R.display_text).height)/2)
        });
    _css(R.display_iconBackground,{
        top:((T-h.skin.getSkinElement("display","background").height)/2),
        left:((U-h.skin.getSkinElement("display","background").width)/2)
        });
    if(e!=U||u!=T){
        e=U;
        u=T;
        d=undefined;
        G()
        }
        if(!h.jwGetFullscreen()){
        w=U;
        N=T
        }
        c();
    o({})
    };
    
this.show=function(){
    if(g){
        g=false;
        r(h.jwGetState())
        }
    };

this.hide=function(){
    if(!g){
        C();
        g=true
        }
    };

function z(T){
    x=R.display_image.naturalWidth;
    P=R.display_image.naturalHeight;
    c()
    }
    function c(){
    if(h.jwGetFullscreen()&&h.jwGetStretching()==a.utils.stretching.EXACTFIT){
        var T=document.createElement("div");
        _utils.stretch(a.utils.stretching.UNIFORM,T,e,u,w,N);
        _utils.stretch(a.utils.stretching.EXACTFIT,R.display_image,_utils.parseDimension(T.style.width),_utils.parseDimension(T.style.height),x,P);
        _css(R.display_image,{
            left:T.style.left,
            top:T.style.top
            })
        }else{
        _utils.stretch(h.jwGetStretching(),R.display_image,e,u,x,P)
        }
    }
function D(T,V){
    var U=document.createElement(T);
    U.id=h.id+"_jwplayer_"+V;
    _css(U,E[V].style);
    return U
    }
    function f(){
    for(var T in R){
        if(_utils.exists(E[T].click)){
            R[T].onclick=E[T].click
            }
        }
    }
    function m(T){
    if(typeof T.preventDefault!="undefined"){
        T.preventDefault()
        }else{
        T.returnValue=false
        }
        if(h.jwGetState()!=a.api.events.state.PLAYING){
        h.jwPlay()
        }else{
        h.jwPause()
        }
    }
function Q(T){
    if(B){
        C();
        return
    }
    R.display_icon.style.backgroundImage=(["url(",h.skin.getSkinElement("display",T).src,")"]).join("");
    _css(R.display_icon,{
        width:h.skin.getSkinElement("display",T).width,
        height:h.skin.getSkinElement("display",T).height,
        top:(h.skin.getSkinElement("display","background").height-h.skin.getSkinElement("display",T).height)/2,
        left:(h.skin.getSkinElement("display","background").width-h.skin.getSkinElement("display",T).width)/2
        });
    b();
    if(_utils.exists(h.skin.getSkinElement("display",T+"Over"))){
        R.display_icon.onmouseover=function(U){
            R.display_icon.style.backgroundImage=["url(",h.skin.getSkinElement("display",T+"Over").src,")"].join("")
            };
            
        R.display_icon.onmouseout=function(U){
            R.display_icon.style.backgroundImage=["url(",h.skin.getSkinElement("display",T).src,")"].join("")
            }
        }else{
    R.display_icon.onmouseover=null;
    R.display_icon.onmouseout=null
    }
}
function C(){
    if(S.icons.toString()=="true"){
        _hide(R.display_icon);
        _hide(R.display_iconBackground);
        O()
        }
    }
function b(){
    if(!g&&S.icons.toString()=="true"){
        _show(R.display_icon);
        _show(R.display_iconBackground);
        G()
        }
    }
function p(T){
    B=true;
    C();
    R.display_text.innerHTML=T.message;
    _show(R.display_text);
    R.display_text.style.top=((u-_utils.getBoundingClientRect(R.display_text).height)/2)+"px"
    }
    function F(){
    R.display_image.style.display="none"
    }
    function o(T){
    if((T.type==a.api.events.JWPLAYER_PLAYER_STATE||T.type==a.api.events.JWPLAYER_PLAYLIST_ITEM)&&B){
        B=false;
        _hide(R.display_text)
        }
        var U=h.jwGetState();
    if(U==t){
        return
    }
    t=U;
    if(A>=0){
        clearTimeout(A)
        }
        if(L||h.jwGetState()==a.api.events.state.PLAYING||h.jwGetState()==a.api.events.state.PAUSED){
        r(h.jwGetState())
        }else{
        A=setTimeout(l(h.jwGetState()),500)
        }
    }
function l(T){
    return(function(){
        r(T)
        })
    }
    function r(T){
    if(_utils.exists(J)){
        clearInterval(J);
        J=null;
        _utils.animations.rotate(R.display_icon,0)
        }
        switch(T){
        case a.api.events.state.BUFFERING:
            if(_utils.isMobile()){
            F();
            C()
            }else{
            if(h.jwGetPlaylist()[h.jwGetItem()].provider=="sound"){
                v()
                }
                s=0;
            J=setInterval(function(){
                s+=K;
                _utils.animations.rotate(R.display_icon,s%360)
                },q);
            Q("bufferIcon");
            L=true
            }
            break;
        case a.api.events.state.PAUSED:
            if(!_utils.isMobile()){
            if(h.jwGetPlaylist()[h.jwGetItem()].provider!="sound"){
                _css(R.display_image,{
                    background:"transparent no-repeat center center"
                })
                }
                Q("playIcon");
            L=true
            }
            break;
        case a.api.events.state.IDLE:
            if(h.jwGetPlaylist()[h.jwGetItem()]&&h.jwGetPlaylist()[h.jwGetItem()].image){
            v()
            }else{
            F()
            }
            Q("playIcon");
            L=true;
            break;
        default:
            if(h.jwGetPlaylist()[h.jwGetItem()]&&h.jwGetPlaylist()[h.jwGetItem()].provider=="sound"){
            if(_utils.isMobile()){
                F();
                L=false
                }else{
                v()
                }
            }else{
            F();
            L=false
            }
            if(h.jwGetMute()&&S.showmute){
            Q("muteIcon")
            }else{
            C()
            }
            break
        }
        A=-1
}
function v(){
    if(h.jwGetPlaylist()[h.jwGetItem()]&&h.jwGetPlaylist()[h.jwGetItem()].image){
        _css(R.display_image,{
            display:"block"
        });
        R.display_image.src=_utils.getAbsolutePath(h.jwGetPlaylist()[h.jwGetItem()].image)
        }
    }
function y(T){
    return function(){
        if(!n){
            return
        }
        if(!g&&d!=T){
            d=T;
            I.sendEvent(T,{
                component:"display",
                boundingRect:_utils.getDimensions(R.display_iconBackground)
                })
            }
        }
}
var G=y(a.api.events.JWPLAYER_COMPONENT_SHOW);
var O=y(a.api.events.JWPLAYER_COMPONENT_HIDE);
return this
}
})(jwplayer);
(function(a){
    var c=a.utils;
    var b=c.css;
    a.html5.dock=function(v,C){
        function w(){
            return{
                align:a.html5.view.positions.RIGHT
                }
            }
        var m=c.extend({},w(),C);
    if(m.align=="FALSE"){
        return
    }
    var h={};
    
    var z=[];
    var j;
    var E;
    var f=false;
    var B=false;
    var g={
        x:0,
        y:0,
        width:0,
        height:0
    };
    
    var y;
    var n;
    var x;
    var l=new a.html5.eventdispatcher();
    c.extend(this,l);
    var q=document.createElement("div");
    q.id=v.id+"_jwplayer_dock";
    q.style.opacity=1;
    o();
    v.jwAddEventListener(a.api.events.JWPLAYER_PLAYER_STATE,p);
    this.getDisplayElement=function(){
        return q
        };
        
    this.setButton=function(J,G,H,I){
        if(!G&&h[J]){
            c.arrays.remove(z,J);
            q.removeChild(h[J].div);
            delete h[J]
        }else{
            if(G){
                if(!h[J]){
                    h[J]={}
                }
                h[J].handler=G;
            h[J].outGraphic=H;
            h[J].overGraphic=I;
            if(!h[J].div){
                z.push(J);
                h[J].div=document.createElement("div");
                h[J].div.style.position="relative";
                q.appendChild(h[J].div);
                h[J].div.appendChild(document.createElement("img"));
                h[J].div.childNodes[0].style.position="absolute";
                h[J].div.childNodes[0].style.left=0;
                h[J].div.childNodes[0].style.top=0;
                h[J].div.childNodes[0].style.zIndex=10;
                h[J].div.childNodes[0].style.cursor="pointer";
                h[J].div.appendChild(document.createElement("img"));
                h[J].div.childNodes[1].style.position="absolute";
                h[J].div.childNodes[1].style.left=0;
                h[J].div.childNodes[1].style.top=0;
                if(v.skin.getSkinElement("dock","button")){
                    h[J].div.childNodes[1].src=v.skin.getSkinElement("dock","button").src
                    }
                    h[J].div.childNodes[1].style.zIndex=9;
                h[J].div.childNodes[1].style.cursor="pointer";
                h[J].div.onmouseover=function(){
                    if(h[J].overGraphic){
                        h[J].div.childNodes[0].src=h[J].overGraphic
                        }
                        if(v.skin.getSkinElement("dock","buttonOver")){
                        h[J].div.childNodes[1].src=v.skin.getSkinElement("dock","buttonOver").src
                        }
                    };
                
            h[J].div.onmouseout=function(){
                if(h[J].outGraphic){
                    h[J].div.childNodes[0].src=h[J].outGraphic
                    }
                    if(v.skin.getSkinElement("dock","button")){
                    h[J].div.childNodes[1].src=v.skin.getSkinElement("dock","button").src
                    }
                };
            
        if(v.skin.getSkinElement("dock","button")){
            h[J].div.childNodes[1].src=v.skin.getSkinElement("dock","button").src
            }
        }
    if(h[J].outGraphic){
    h[J].div.childNodes[0].src=h[J].outGraphic
    }else{
    if(h[J].overGraphic){
        h[J].div.childNodes[0].src=h[J].overGraphic
        }
    }
if(G){
    h[J].div.onclick=function(K){
        K.preventDefault();
        a(v.id).callback(J);
        if(h[J].overGraphic){
            h[J].div.childNodes[0].src=h[J].overGraphic
            }
            if(v.skin.getSkinElement("dock","button")){
            h[J].div.childNodes[1].src=v.skin.getSkinElement("dock","button").src
            }
        }
}
}
}
k(j,E)
};

function s(G){}
function k(G,S){
    o();
    if(z.length>0){
        var H=10;
        var R=H;
        var O=-1;
        var P=v.skin.getSkinElement("dock","button").height;
        var N=v.skin.getSkinElement("dock","button").width;
        var L=G-N-H;
        var Q,K;
        if(m.align==a.html5.view.positions.LEFT){
            O=1;
            L=H
            }
            for(var I=0;I<z.length;I++){
            var T=Math.floor(R/S);
            if((R+P+H)>((T+1)*S)){
                R=((T+1)*S)+H;
                T=Math.floor(R/S)
                }
                var J=h[z[I]].div;
            J.style.top=(R%S)+"px";
            J.style.left=(L+(v.skin.getSkinElement("dock","button").width+H)*T*O)+"px";
            var M={
                x:c.parseDimension(J.style.left),
                y:c.parseDimension(J.style.top),
                width:N,
                height:P
            };
            
            if(!Q||(M.x<=Q.x&&M.y<=Q.y)){
                Q=M
                }
                if(!K||(M.x>=K.x&&M.y>=K.y)){
                K=M
                }
                R+=v.skin.getSkinElement("dock","button").height+H
            }
            g={
            x:Q.x,
            y:Q.y,
            width:K.x-Q.x+K.width,
            height:Q.y-K.y+K.height
            }
        }
    if(B!=v.jwGetFullscreen()||j!=G||E!=S){
    j=G;
    E=S;
    B=v.jwGetFullscreen();
    y=undefined;
    setTimeout(r,1)
    }
}
function d(G){
    return function(){
        if(!f&&y!=G&&z.length>0){
            y=G;
            l.sendEvent(G,{
                component:"dock",
                boundingRect:g
            })
            }
        }
}
function p(G){
    if(c.isMobile()){
        if(G.newstate==a.api.events.state.IDLE){
            u()
            }else{
            e()
            }
        }else{
    A()
    }
}
function A(G){
    if(f){
        return
    }
    clearTimeout(x);
    if(C.position==a.html5.view.positions.OVER||v.jwGetFullscreen()){
        switch(v.jwGetState()){
            case a.api.events.state.PAUSED:case a.api.events.state.IDLE:
                if(q&&q.style.opacity<1&&(!C.idlehide||c.exists(G))){
                D()
                }
                if(C.idlehide){
                x=setTimeout(function(){
                    t()
                    },2000)
                }
                break;
            default:
                if(c.exists(G)){
                D()
                }
                x=setTimeout(function(){
                t()
                },2000);
            break
            }
            }else{
    D()
    }
}
var r=d(a.api.events.JWPLAYER_COMPONENT_SHOW);
var F=d(a.api.events.JWPLAYER_COMPONENT_HIDE);
this.resize=k;
var u=function(){
    b(q,{
        display:"block"
    });
    if(f){
        f=false;
        r()
        }
    };

var e=function(){
    b(q,{
        display:"none"
    });
    if(!f){
        F();
        f=true
        }
    };

function t(){
    if(!f){
        F();
        if(q.style.opacity==1){
            c.cancelAnimation(q);
            c.fadeTo(q,0,0.1,1,0)
            }
        }
}
function D(){
    if(!f){
        r();
        if(q.style.opacity==0){
            c.cancelAnimation(q);
            c.fadeTo(q,1,0.1,0,0)
            }
        }
}
function o(){
    n=document.getElementById(v.id);
    n.addEventListener("mousemove",A)
    }
    this.hide=e;
this.show=u;
return this
}
})(jwplayer);
(function(a){
    a.html5.eventdispatcher=function(d,b){
        var c=new a.events.eventdispatcher(b);
        a.utils.extend(this,c);
        this.sendEvent=function(e,f){
            if(!a.utils.exists(f)){
                f={}
            }
            a.utils.extend(f,{
            id:d,
            version:a.version,
            type:e
        });
        c.sendEvent(e,f)
        }
    }
})(jwplayer);
(function(a){
    var b={
        prefix:"http://l.longtailvideo.com/html5/",
        file:"logo.png",
        link:"http://www.longtailvideo.com/players/jw-flv-player/",
        margin:8,
        out:0.5,
        over:1,
        timeout:5,
        hide:true,
        position:"bottom-left"
    };
    
    _css=a.utils.css;
    a.html5.logo=function(n,r){
        var q=n;
        var u;
        var d;
        var t;
        var h=false;
        g();
        function g(){
            o();
            q.jwAddEventListener(a.api.events.JWPLAYER_PLAYER_STATE,j);
            c();
            l()
            }
            function o(){
            if(b.prefix){
                var v=n.version.split(/\W/).splice(0,2).join("/");
                if(b.prefix.indexOf(v)<0){
                    b.prefix+=v+"/"
                    }
                }
            if(r.position==a.html5.view.positions.OVER){
            r.position=b.position
            }
            try{
            if(window.location.href.indexOf("https")==0){
                b.prefix=b.prefix.replace("http://l.longtailvideo.com","https://securel.longtailvideo.com")
                }
            }catch(w){}
    d=a.utils.extend({},b)
    }
    function c(){
    t=document.createElement("img");
    t.id=q.id+"_jwplayer_logo";
    t.style.display="none";
    t.onload=function(v){
        _css(t,k());
        p()
        };
        
    if(!d.file){
        return
    }
    if(d.file.indexOf("/")>=0){
        t.src=d.file
        }else{
        t.src=d.prefix+d.file
        }
    }
if(!d.file){
    return
}
this.resize=function(w,v){};
    
    this.getDisplayElement=function(){
    return t
    };
    
function l(){
    if(d.link){
        t.onmouseover=f;
        t.onmouseout=p;
        t.onclick=s
        }else{
        this.mouseEnabled=false
        }
    }
function s(v){
    if(typeof v!="undefined"){
        v.stopPropagation()
        }
        if(!h){
        return
    }
    q.jwPause();
    q.jwSetFullscreen(false);
    if(d.link){
        window.open(d.link,"_top")
        }
        return
}
function p(v){
    if(d.link&&h){
        t.style.opacity=d.out
        }
        return
}
function f(v){
    if(h){
        t.style.opacity=d.over
        }
        return
}
function k(){
    var x={
        textDecoration:"none",
        position:"absolute",
        cursor:"pointer"
    };
    
    x.display=(d.hide.toString()=="true"&&!h)?"none":"block";
    var w=d.position.toLowerCase().split("-");
    for(var v in w){
        x[w[v]]=d.margin
        }
        return x
    }
    function m(){
    if(d.hide.toString()=="true"){
        t.style.display="block";
        t.style.opacity=0;
        a.utils.fadeTo(t,d.out,0.1,parseFloat(t.style.opacity));
        u=setTimeout(function(){
            e()
            },d.timeout*1000)
        }
        h=true
    }
    function e(){
    h=false;
    if(d.hide.toString()=="true"){
        a.utils.fadeTo(t,0,0.1,parseFloat(t.style.opacity))
        }
    }
function j(v){
    if(v.newstate==a.api.events.state.BUFFERING){
        clearTimeout(u);
        m()
        }
    }
return this
}
})(jwplayer);
(function(b){
    var d={
        ended:b.api.events.state.IDLE,
        playing:b.api.events.state.PLAYING,
        pause:b.api.events.state.PAUSED,
        buffering:b.api.events.state.BUFFERING
        };
        
    var e=b.utils;
    var c=e.css;
    var a=e.isMobile();
    b.html5.mediavideo=function(j,v){
        var u={
            abort:p,
            canplay:m,
            canplaythrough:m,
            durationchange:L,
            emptied:p,
            ended:m,
            error:x,
            loadeddata:L,
            loadedmetadata:L,
            loadstart:m,
            pause:m,
            play:p,
            playing:m,
            progress:y,
            ratechange:p,
            seeked:m,
            seeking:m,
            stalled:m,
            suspend:m,
            timeupdate:I,
            volumechange:E,
            waiting:m,
            canshowcurrentframe:p,
            dataunavailable:p,
            empty:p,
            load:D,
            loadedfirstframe:p,
            webkitfullscreenchange:k
        };
        
        var l=new b.html5.eventdispatcher();
        e.extend(this,l);
        var B=j,n=v,o,G,F,A,g,M=false,C=false,H,r,s;
        q();
        this.load=function(O,P){
            if(typeof P=="undefined"){
                P=true
                }
                if(!C){
                return
            }
            A=O;
            e.empty(o);
            s=0;
            if(O.levels&&O.levels.length>0){
                if(O.levels.length==1){
                    o.src=O.levels[0].file
                    }else{
                    f(O.levels);
                    if(o.src){
                        o.removeAttribute("src")
                        }
                        for(var N=0;N<O.levels.length;N++){
                        var Q=o.ownerDocument.createElement("source");
                        Q.src=O.levels[N].file;
                        o.appendChild(Q);
                        s++
                    }
                    }
                }else{
        o.src=O.file
        }
        if(a){
        if(O.image){
            o.poster=O.image
            }
            o.style.display="block";
        setTimeout(function(){
            o.setAttribute("controls","controls")
            },100)
        }
        H=r=F=false;
    B.buffer=0;
    if(!e.exists(O.start)){
        O.start=0
        }
        B.duration=O.duration;
    l.sendEvent(b.api.events.JWPLAYER_MEDIA_LOADED);
    if((!a&&O.levels.length==1)||!M){
        o.load()
        }
        M=false;
    if(P){
        J(b.api.events.state.BUFFERING);
        l.sendEvent(b.api.events.JWPLAYER_MEDIA_BUFFER,{
            bufferPercent:0
        });
        this.play()
        }
    };

this.play=function(){
    if(!C){
        return
    }
    if(G!=b.api.events.state.PLAYING){
        w();
        if(r){
            J(b.api.events.state.PLAYING)
            }else{
            J(b.api.events.state.BUFFERING)
            }
            o.play()
        }
    };

this.pause=function(){
    if(!C){
        return
    }
    o.pause();
    J(b.api.events.state.PAUSED)
    };
    
this.seek=function(N){
    if(!C){
        return
    }
    if(!(B.duration<=0||isNaN(B.duration))&&!(B.position<=0||isNaN(B.position))){
        o.currentTime=N;
        o.play()
        }
    };

_stop=this.stop=function(N){
    if(!C){
        return
    }
    if(!e.exists(N)){
        N=true
        }
        h();
    if(N){
        o.style.display="none";
        r=false;
        var O=navigator.userAgent;
        if(O.match(/chrome/i)){
            o.src=undefined
            }else{
            if(O.match(/safari/i)||O.match(/firefox/i)){
                o.removeAttribute("src")
                }else{
                o.src=""
                }
            }
        o.removeAttribute("controls");
    o.removeAttribute("poster");
    e.empty(o);
    o.load();
    M=true;
    if(o.webkitSupportsFullscreen){
        try{
            o.webkitExitFullscreen()
            }catch(P){}
    }
}
J(b.api.events.state.IDLE)
};

this.fullscreen=function(N){
    if(N===true){
        this.resize("100%","100%")
        }else{
        this.resize(B.config.width,B.config.height)
        }
    };

this.resize=function(O,N){};

this.volume=function(N){
    if(!a){
        o.volume=N/100
        }
    };

this.mute=function(N){
    if(!a){
        o.muted=N
        }
    };

this.getDisplayElement=function(){
    return o
    };
    
this.hasChrome=function(){
    return a
    };
    
this.detachMedia=function(){
    C=false;
    return this.getDisplayElement()
    };
    
this.attachMedia=function(){
    C=true
    };
    
function t(O,N){
    return function(P){
        if(C&&e.exists(P.target.parentNode)){
            N(P)
            }
        }
}
function q(){
    o=document.createElement("video");
    G=b.api.events.state.IDLE;
    for(var N in u){
        o.addEventListener(N,t(N,u[N]),true)
        }
        C=true;
    o.setAttribute("x-webkit-airplay","allow");
    if(n.parentNode){
        n.parentNode.replaceChild(o,n)
        }
        if(!o.id){
        o.id=n.id
        }
        o.volume=B.volume/100
    }
    function J(N){
    if(N==b.api.events.state.PAUSED&&G==b.api.events.state.IDLE){
        return
    }
    if(G!=N){
        var O=G;
        B.state=G=N;
        l.sendEvent(b.api.events.JWPLAYER_PLAYER_STATE,{
            oldstate:O,
            newstate:N
        })
        }
    }
function p(N){}
function E(N){
    var O=Math.round(o.volume*100);
    if(O!=B.volume){
        B.volume=O;
        l.sendEvent(b.api.events.JWPLAYER_MEDIA_VOLUME,{
            volume:B.volume
            })
        }
        if(o.muted!=B.mute){
        B.mute=o.muted;
        l.sendEvent(b.api.events.JWPLAYER_MEDIA_MUTE,{
            mute:B.mute
            })
        }
    }
function y(P){
    var O;
    if(e.exists(P)&&P.lengthComputable&&P.total){
        O=P.loaded/P.total*100
        }else{
        if(e.exists(o.buffered)&&(o.buffered.length>0)){
            var N=o.buffered.length-1;
            if(N>=0){
                O=o.buffered.end(N)/o.duration*100
                }
            }
    }
if(r===false&&G==b.api.events.state.BUFFERING){
    l.sendEvent(b.api.events.JWPLAYER_MEDIA_BUFFER_FULL);
    r=true
    }
    if(!H){
    if(O==100){
        H=true
        }
        if(e.exists(O)&&(O>B.buffer)){
        B.buffer=Math.round(O);
        l.sendEvent(b.api.events.JWPLAYER_MEDIA_BUFFER,{
            bufferPercent:Math.round(O)
            })
        }
    }
}
function I(O){
    if(e.exists(O)&&e.exists(O.target)){
        if(!isNaN(O.target.duration)&&(isNaN(B.duration)||B.duration<1)){
            if(O.target.duration==Infinity){
                B.duration=0
                }else{
                B.duration=Math.round(O.target.duration*10)/10
                }
            }
        if(!F&&o.readyState>0){
        o.style.display="block";
        J(b.api.events.state.PLAYING)
        }
        if(G==b.api.events.state.PLAYING){
        if(!F&&o.readyState>0){
            F=true;
            try{
                if(o.currentTime<A.start){
                    o.currentTime=A.start
                    }
                }catch(N){}
        o.volume=B.volume/100;
        o.muted=B.mute
        }
        B.position=B.duration>0?(Math.round(O.target.currentTime*10)/10):0;
    l.sendEvent(b.api.events.JWPLAYER_MEDIA_TIME,{
        position:B.position,
        duration:B.duration
        });
    if(B.position>=B.duration&&(B.position>0||B.duration>0)){
        z()
        }
    }
}
y(O)
}
function D(N){}
function m(N){
    if(d[N.type]){
        if(N.type=="ended"){
            z()
            }else{
            J(d[N.type])
            }
        }
}
function L(O){
    var N=Math.round(O.target.duration*10)/10;
    var P={
        height:O.target.videoHeight,
        width:O.target.videoWidth,
        duration:N
    };
    
    if((B.duration<N||isNaN(B.duration))&&O.target.duration!=Infinity){
        B.duration=N
        }
        l.sendEvent(b.api.events.JWPLAYER_MEDIA_META,{
        metadata:P
    })
    }
    function x(P){
    if(G==b.api.events.state.IDLE){
        return
    }
    var O="There was an error: ";
    if((P.target.error&&P.target.tagName.toLowerCase()=="video")||P.target.parentNode.error&&P.target.parentNode.tagName.toLowerCase()=="video"){
        var N=!e.exists(P.target.error)?P.target.parentNode.error:P.target.error;
        switch(N.code){
            case N.MEDIA_ERR_ABORTED:
                O="You aborted the video playback: ";
                break;
            case N.MEDIA_ERR_NETWORK:
                O="A network error caused the video download to fail part-way: ";
                break;
            case N.MEDIA_ERR_DECODE:
                O="The video playback was aborted due to a corruption problem or because the video used features your browser did not support: ";
                break;
            case N.MEDIA_ERR_SRC_NOT_SUPPORTED:
                O="The video could not be loaded, either because the server or network failed or because the format is not supported: ";
                break;
            default:
                O="An unknown error occurred: ";
                break
                }
            }else{
    if(P.target.tagName.toLowerCase()=="source"){
        s--;
        if(s>0){
            return
        }
        O="The video could not be loaded, either because the server or network failed or because the format is not supported: "
        }else{
        e.log("An unknown error occurred.  Continuing...");
        return
    }
}
_stop(false);
O+=K();
_error=true;
l.sendEvent(b.api.events.JWPLAYER_ERROR,{
    message:O
});
return
}
function K(){
    var P="";
    for(var O in A.levels){
        var N=A.levels[O];
        var Q=n.ownerDocument.createElement("source");
        P+=b.utils.getAbsolutePath(N.file);
        if(O<(A.levels.length-1)){
            P+=", "
            }
        }
    return P
}
function w(){
    if(!e.exists(g)){
        g=setInterval(function(){
            y()
            },100)
        }
    }
function h(){
    clearInterval(g);
    g=null
    }
    function z(){
    if(G!=b.api.events.state.IDLE){
        _stop(false);
        l.sendEvent(b.api.events.JWPLAYER_MEDIA_COMPLETE)
        }
    }
function k(N){
    if(e.exists(o.webkitDisplayingFullscreen)){
        if(B.fullscreen&&!o.webkitDisplayingFullscreen){
            l.sendEvent(b.api.events.JWPLAYER_FULLSCREEN,{
                fullscreen:false
            })
            }
        }
}
function f(P){
    if(P.length>0&&e.isIOS()){
        if(e.extension(P[0].file)!="mp4"){
            var N=-1;
            for(var O=1;O<P.length;O++){
                if(e.extension(P[O].file)=="mp4"){
                    N=O;
                    break
                }
            }
            if(N>-1){
            var Q=P.splice(N,1)[0];
            P.unshift(Q)
            }
        }
}
}
}
})(jwplayer);
(function(a){
    var c={
        ended:a.api.events.state.IDLE,
        playing:a.api.events.state.PLAYING,
        pause:a.api.events.state.PAUSED,
        buffering:a.api.events.state.BUFFERING
        };
        
    var b=a.utils.css;
    a.html5.mediayoutube=function(j,e){
        var f=new a.html5.eventdispatcher();
        a.utils.extend(this,f);
        var l=j;
        var h=document.getElementById(e.id);
        var g=a.api.events.state.IDLE;
        var n,m;
        function k(p){
            if(g!=p){
                var q=g;
                l.state=p;
                g=p;
                f.sendEvent(a.api.events.JWPLAYER_PLAYER_STATE,{
                    oldstate:q,
                    newstate:p
                })
                }
            }
        this.getDisplayElement=this.detachMedia=function(){
        return h
        };
        
    this.attachMedia=function(){};
    
    this.play=function(){
        if(g==a.api.events.state.IDLE){
            f.sendEvent(a.api.events.JWPLAYER_MEDIA_BUFFER,{
                bufferPercent:100
            });
            f.sendEvent(a.api.events.JWPLAYER_MEDIA_BUFFER_FULL);
            k(a.api.events.state.PLAYING)
            }else{
            if(g==a.api.events.state.PAUSED){
                k(a.api.events.state.PLAYING)
                }
            }
    };

this.pause=function(){
    k(a.api.events.state.PAUSED)
    };
    
this.seek=function(p){};
    
    this.stop=function(p){
    if(!_utils.exists(p)){
        p=true
        }
        l.position=0;
    k(a.api.events.state.IDLE);
    if(p){
        b(h,{
            display:"none"
        })
        }
    };

this.volume=function(p){
    l.volume=p;
    f.sendEvent(a.api.events.JWPLAYER_MEDIA_VOLUME,{
        volume:Math.round(p)
        })
    };
    
this.mute=function(p){
    h.muted=p;
    l.mute=p;
    f.sendEvent(a.api.events.JWPLAYER_MEDIA_MUTE,{
        mute:p
    })
    };
    
this.resize=function(q,p){
    if(q*p>0&&n){
        n.width=m.width=q;
        n.height=m.height=p
        }
    };

this.fullscreen=function(p){
    if(p===true){
        this.resize("100%","100%")
        }else{
        this.resize(l.config.width,l.config.height)
        }
    };

this.load=function(p){
    o(p);
    b(n,{
        display:"block"
    });
    k(a.api.events.state.BUFFERING);
    f.sendEvent(a.api.events.JWPLAYER_MEDIA_BUFFER,{
        bufferPercent:0
    });
    f.sendEvent(a.api.events.JWPLAYER_MEDIA_LOADED);
    this.play()
    };
    
this.hasChrome=function(){
    return(g!=a.api.events.state.IDLE)
    };
    
function o(v){
    var s=v.levels[0].file;
    s=["http://www.youtube.com/v/",d(s),"&amp;hl=en_US&amp;fs=1&autoplay=1"].join("");
    n=document.createElement("object");
    n.id=h.id;
    n.style.position="absolute";
    var u={
        movie:s,
        allowfullscreen:"true",
        allowscriptaccess:"always"
    };
    
    for(var p in u){
        var t=document.createElement("param");
        t.name=p;
        t.value=u[p];
        n.appendChild(t)
        }
        m=document.createElement("embed");
    n.appendChild(m);
    var q={
        src:s,
        type:"application/x-shockwave-flash",
        allowfullscreen:"true",
        allowscriptaccess:"always",
        width:n.width,
        height:n.height
        };
        
    for(var r in q){
        m.setAttribute(r,q[r])
        }
        n.appendChild(m);
    n.style.zIndex=2147483000;
    if(h!=n&&h.parentNode){
        h.parentNode.replaceChild(n,h)
        }
        h=n
    }
    function d(q){
    var p=q.split(/\?|\#\!/);
    var s="";
    for(var r=0;r<p.length;r++){
        if(p[r].substr(0,2)=="v="){
            s=p[r].substr(2)
            }
        }
    if(s==""){
    if(q.indexOf("/v/")>=0){
        s=q.substr(q.indexOf("/v/")+3)
        }else{
        if(q.indexOf("youtu.be")>=0){
            s=q.substr(q.indexOf("youtu.be/")+9)
            }else{
            s=q
            }
        }
}
if(s.indexOf("?")>-1){
    s=s.substr(0,s.indexOf("?"))
    }
    if(s.indexOf("&")>-1){
    s=s.substr(0,s.indexOf("&"))
    }
    return s
}
this.embed=m;
return this
}
})(jwplayer);
(function(jwplayer){
    var _configurableStateVariables=["width","height","start","duration","volume","mute","fullscreen","item","plugins","stretching"];
    jwplayer.html5.model=function(api,container,options){
        var _api=api;
        var _container=container;
        var _model={
            id:_container.id,
            playlist:[],
            state:jwplayer.api.events.state.IDLE,
            position:0,
            buffer:0,
            config:{
                width:480,
                height:320,
                item:-1,
                skin:undefined,
                file:undefined,
                image:undefined,
                start:0,
                duration:0,
                bufferlength:5,
                volume:90,
                mute:false,
                fullscreen:false,
                repeat:"",
                stretching:jwplayer.utils.stretching.UNIFORM,
                autostart:false,
                debug:undefined,
                screencolor:undefined
            }
        };
        
    var _media;
    var _eventDispatcher=new jwplayer.html5.eventdispatcher();
    var _components=["display","logo","controlbar","playlist","dock"];
    jwplayer.utils.extend(_model,_eventDispatcher);
    for(var option in options){
        if(typeof options[option]=="string"){
            var type=/color$/.test(option)?"color":null;
            options[option]=jwplayer.utils.typechecker(options[option],type)
            }
            var config=_model.config;
        var path=option.split(".");
        for(var edge in path){
            if(edge==path.length-1){
                config[path[edge]]=options[option]
                }else{
                if(!jwplayer.utils.exists(config[path[edge]])){
                    config[path[edge]]={}
                }
                config=config[path[edge]]
            }
        }
        }
    for(var index in _configurableStateVariables){
    var configurableStateVariable=_configurableStateVariables[index];
    _model[configurableStateVariable]=_model.config[configurableStateVariable]
    }
    var pluginorder=_components.concat([]);
if(jwplayer.utils.exists(_model.plugins)){
    if(typeof _model.plugins=="string"){
        var userplugins=_model.plugins.split(",");
        for(var userplugin in userplugins){
            if(typeof userplugins[userplugin]=="string"){
                pluginorder.push(userplugins[userplugin].replace(/^\s+|\s+$/g,""))
                }
            }
        }
    }
if(jwplayer.utils.isMobile()){
    pluginorder=["display","logo","dock","playlist"];
    if(!jwplayer.utils.exists(_model.config.repeat)){
        _model.config.repeat="list"
        }
    }else{
    if(_model.config.chromeless){
        pluginorder=["logo","dock","playlist"];
        if(!jwplayer.utils.exists(_model.config.repeat)){
            _model.config.repeat="list"
            }
        }
}
_model.plugins={
    order:pluginorder,
    config:{},
    object:{}
};

if(typeof _model.config.components!="undefined"){
    for(var component in _model.config.components){
        _model.plugins.config[component]=_model.config.components[component]
        }
    }
    var playlistVisible=false;
for(var pluginIndex in _model.plugins.order){
    var pluginName=_model.plugins.order[pluginIndex];
    var pluginConfig=!jwplayer.utils.exists(_model.plugins.config[pluginName])?{}:_model.plugins.config[pluginName];
    _model.plugins.config[pluginName]=!jwplayer.utils.exists(_model.plugins.config[pluginName])?pluginConfig:jwplayer.utils.extend(_model.plugins.config[pluginName],pluginConfig);
    if(!jwplayer.utils.exists(_model.plugins.config[pluginName].position)){
        if(pluginName=="playlist"){
            _model.plugins.config[pluginName].position=jwplayer.html5.view.positions.NONE
            }else{
            _model.plugins.config[pluginName].position=jwplayer.html5.view.positions.OVER
            }
        }else{
    if(pluginName=="playlist"){
        playlistVisible=true
        }
        _model.plugins.config[pluginName].position=_model.plugins.config[pluginName].position.toString().toUpperCase()
    }
}
if(_model.plugins.config.controlbar&&playlistVisible){
    _model.plugins.config.controlbar.hideplaylistcontrols=true
    }
    if(typeof _model.plugins.config.dock!="undefined"){
    if(typeof _model.plugins.config.dock!="object"){
        var position=_model.plugins.config.dock.toString().toUpperCase();
        _model.plugins.config.dock={
            position:position
        }
    }
    if(typeof _model.plugins.config.dock.position!="undefined"){
    _model.plugins.config.dock.align=_model.plugins.config.dock.position;
    _model.plugins.config.dock.position=jwplayer.html5.view.positions.OVER
    }
    if(typeof _model.plugins.config.dock.idlehide=="undefined"){
    try{
        _model.plugins.config.dock.idlehide=_model.plugins.config.controlbar.idlehide
        }catch(e){}
}
}
function _loadExternal(playlistfile){
    var loader=new jwplayer.html5.playlistloader();
    loader.addEventListener(jwplayer.api.events.JWPLAYER_PLAYLIST_LOADED,function(evt){
        _model.playlist=new jwplayer.html5.playlist(evt);
        _loadComplete(true)
        });
    loader.addEventListener(jwplayer.api.events.JWPLAYER_ERROR,function(evt){
        _model.playlist=new jwplayer.html5.playlist({
            playlist:[]
        });
        _loadComplete(false)
        });
    loader.load(playlistfile)
    }
    function _loadComplete(){
    if(_model.config.shuffle){
        _model.item=_getShuffleItem()
        }else{
        if(_model.config.item>=_model.playlist.length){
            _model.config.item=_model.playlist.length-1
            }else{
            if(_model.config.item<0){
                _model.config.item=0
                }
            }
        _model.item=_model.config.item
    }
    _model.position=0;
_model.duration=_model.playlist.length>0?_model.playlist[_model.item].duration:0;
_eventDispatcher.sendEvent(jwplayer.api.events.JWPLAYER_PLAYLIST_LOADED,{
    playlist:_model.playlist
    });
_eventDispatcher.sendEvent(jwplayer.api.events.JWPLAYER_PLAYLIST_ITEM,{
    index:_model.item
    })
}
_model.loadPlaylist=function(arg){
    var input;
    if(typeof arg=="string"){
        if(arg.indexOf("[")==0||arg.indexOf("{")=="0"){
            try{
                input=eval(arg)
                }catch(err){
                input=arg
                }
            }else{
        input=arg
        }
    }else{
    input=arg
    }
    var config;
switch(jwplayer.utils.typeOf(input)){
    case"object":
        config=input;
        break;
    case"array":
        config={
        playlist:input
    };
    
    break;
    default:
        config={
        file:input
    };
    
    break
    }
    _model.playlist=new jwplayer.html5.playlist(config);
_model.item=_model.config.item>=0?_model.config.item:0;
if(!_model.playlist[_model.item].provider){
    _loadExternal(_model.playlist[_model.item].file)
    }else{
    _loadComplete()
    }
};

function _getShuffleItem(){
    var result=null;
    if(_model.playlist.length>1){
        while(!jwplayer.utils.exists(result)){
            result=Math.floor(Math.random()*_model.playlist.length);
            if(result==_model.item){
                result=null
                }
            }
    }else{
    result=0
    }
    return result
}
function forward(evt){
    if(evt.type==jwplayer.api.events.JWPLAYER_MEDIA_LOADED){
        _container=_media.getDisplayElement()
        }
        _eventDispatcher.sendEvent(evt.type,evt)
    }
    var _mediaProviders={};

_model.setActiveMediaProvider=function(playlistItem){
    if(playlistItem.provider=="audio"){
        playlistItem.provider="sound"
        }
        var provider=playlistItem.provider;
    var current=_media?_media.getDisplayElement():null;
    if(provider=="sound"||provider=="http"||provider==""){
        provider="video"
        }
        if(!jwplayer.utils.exists(_mediaProviders[provider])){
        switch(provider){
            case"video":
                _media=new jwplayer.html5.mediavideo(_model,current?current:_container);
                break;
            case"youtube":
                _media=new jwplayer.html5.mediayoutube(_model,current?current:_container);
                break
                }
                if(!jwplayer.utils.exists(_media)){
            return false
            }
            _media.addGlobalListener(forward);
        _mediaProviders[provider]=_media
        }else{
        if(_media!=_mediaProviders[provider]){
            if(_media){
                _media.stop()
                }
                _media=_mediaProviders[provider]
            }
        }
    return true
};

_model.getMedia=function(){
    return _media
    };
    
_model.seek=function(pos){
    _eventDispatcher.sendEvent(jwplayer.api.events.JWPLAYER_MEDIA_SEEK,{
        position:_model.position,
        offset:pos
    });
    return _media.seek(pos)
    };
    
_model.setupPlugins=function(){
    if(!jwplayer.utils.exists(_model.plugins)||!jwplayer.utils.exists(_model.plugins.order)||_model.plugins.order.length==0){
        jwplayer.utils.log("No plugins to set up");
        return _model
        }
        for(var i=0;i<_model.plugins.order.length;i++){
        try{
            var pluginName=_model.plugins.order[i];
            if(jwplayer.utils.exists(jwplayer.html5[pluginName])){
                if(pluginName=="playlist"){
                    _model.plugins.object[pluginName]=new jwplayer.html5.playlistcomponent(_api,_model.plugins.config[pluginName])
                    }else{
                    _model.plugins.object[pluginName]=new jwplayer.html5[pluginName](_api,_model.plugins.config[pluginName])
                    }
                }else{
            _model.plugins.order.splice(plugin,plugin+1)
            }
            if(typeof _model.plugins.object[pluginName].addGlobalListener=="function"){
            _model.plugins.object[pluginName].addGlobalListener(forward)
            }
        }catch(err){
        jwplayer.utils.log("Could not setup "+pluginName)
        }
    }
};

return _model
}
})(jwplayer);
(function(a){
    a.html5.playlist=function(b){
        var d=[];
        if(b.playlist&&b.playlist instanceof Array&&b.playlist.length>0){
            for(var c in b.playlist){
                if(!isNaN(parseInt(c))){
                    d.push(new a.html5.playlistitem(b.playlist[c]))
                    }
                }
            }else{
    d.push(new a.html5.playlistitem(b))
    }
    return d
}
})(jwplayer);
(function(a){
    var c={
        size:180,
        position:a.html5.view.positions.NONE,
        itemheight:60,
        thumbs:true,
        fontcolor:"#000000",
        overcolor:"",
        activecolor:"",
        backgroundcolor:"#f8f8f8",
        font:"_sans",
        fontsize:"",
        fontstyle:"",
        fontweight:""
    };
    
    var b={
        _sans:"Arial, Helvetica, sans-serif",
        _serif:"Times, Times New Roman, serif",
        _typewriter:"Courier New, Courier, monospace"
    };
    
    _utils=a.utils;
    _css=_utils.css;
    _hide=function(d){
        _css(d,{
            display:"none"
        })
        };
        
    _show=function(d){
        _css(d,{
            display:"block"
        })
        };
        
    a.html5.playlistcomponent=function(r,B){
        var w=r;
        var e=a.utils.extend({},c,w.skin.getComponentSettings("playlist"),B);
        if(e.position==a.html5.view.positions.NONE||typeof a.html5.view.positions[e.position]=="undefined"){
            return
        }
        var x;
        var l;
        var C;
        var d;
        var g;
        var f;
        var k=-1;
        var h={
            background:undefined,
            item:undefined,
            itemOver:undefined,
            itemImage:undefined,
            itemActive:undefined
        };
        
        this.getDisplayElement=function(){
            return x
            };
            
        this.resize=function(F,D){
            l=F;
            C=D;
            if(w.jwGetFullscreen()){
                _hide(x)
                }else{
                var E={
                    display:"block",
                    width:l,
                    height:C
                };
                
                _css(x,E)
                }
            };
        
    this.show=function(){
        _show(x)
        };
        
    this.hide=function(){
        _hide(x)
        };
        
    function j(){
        x=document.createElement("div");
        x.id=w.id+"_jwplayer_playlistcomponent";
        x.style.overflow="hidden";
        switch(e.position){
            case a.html5.view.positions.RIGHT:case a.html5.view.positions.LEFT:
                x.style.width=e.size+"px";
                break;
            case a.html5.view.positions.TOP:case a.html5.view.positions.BOTTOM:
                x.style.height=e.size+"px";
                break
                }
                A();
        if(h.item){
            e.itemheight=h.item.height
            }
            x.style.backgroundColor="#C6C6C6";
        w.jwAddEventListener(a.api.events.JWPLAYER_PLAYLIST_LOADED,s);
        w.jwAddEventListener(a.api.events.JWPLAYER_PLAYLIST_ITEM,u);
        w.jwAddEventListener(a.api.events.JWPLAYER_PLAYER_STATE,m)
        }
        function p(){
        var D=document.createElement("ul");
        _css(D,{
            width:x.style.width,
            minWidth:x.style.width,
            height:x.style.height,
            backgroundColor:e.backgroundcolor,
            backgroundImage:h.background?"url("+h.background.src+")":"",
            color:e.fontcolor,
            listStyle:"none",
            margin:0,
            padding:0,
            fontFamily:b[e.font]?b[e.font]:b._sans,
            fontSize:(e.fontsize?e.fontsize:11)+"px",
            fontStyle:e.fontstyle,
            fontWeight:e.fontweight,
            overflowY:"auto"
        });
        return D
        }
        function y(D){
        return function(){
            var E=f.getElementsByClassName("item")[D];
            var F=e.fontcolor;
            var G=h.item?"url("+h.item.src+")":"";
            if(D==w.jwGetPlaylistIndex()){
                if(e.activecolor!==""){
                    F=e.activecolor
                    }
                    if(h.itemActive){
                    G="url("+h.itemActive.src+")"
                    }
                }
            _css(E,{
            color:e.overcolor!==""?e.overcolor:F,
            backgroundImage:h.itemOver?"url("+h.itemOver.src+")":G
            })
        }
    }
function o(D){
    return function(){
        var E=f.getElementsByClassName("item")[D];
        var F=e.fontcolor;
        var G=h.item?"url("+h.item.src+")":"";
        if(D==w.jwGetPlaylistIndex()){
            if(e.activecolor!==""){
                F=e.activecolor
                }
                if(h.itemActive){
                G="url("+h.itemActive.src+")"
                }
            }
        _css(E,{
        color:F,
        backgroundImage:G
    })
    }
}
function q(I){
    var P=d[I];
    var O=document.createElement("li");
    O.className="item";
    _css(O,{
        height:e.itemheight,
        display:"block",
        cursor:"pointer",
        backgroundImage:h.item?"url("+h.item.src+")":"",
        backgroundSize:"100% "+e.itemheight+"px"
        });
    O.onmouseover=y(I);
    O.onmouseout=o(I);
    var J=document.createElement("div");
    var F=new Image();
    var K=0;
    var L=0;
    var M=0;
    if(v()&&(P.image||P["playlist.image"]||h.itemImage)){
        F.className="image";
        if(h.itemImage){
            K=(e.itemheight-h.itemImage.height)/2;
            L=h.itemImage.width;
            M=h.itemImage.height
            }else{
            L=e.itemheight*4/3;
            M=e.itemheight
            }
            _css(J,{
            height:M,
            width:L,
            "float":"left",
            styleFloat:"left",
            cssFloat:"left",
            margin:"0 5px 0 0",
            background:"black",
            overflow:"hidden",
            margin:K+"px",
            position:"relative"
        });
        _css(F,{
            position:"relative"
        });
        J.appendChild(F);
        F.onload=function(){
            a.utils.stretch(a.utils.stretching.FILL,F,L,M,this.naturalWidth,this.naturalHeight)
            };
            
        if(P["playlist.image"]){
            F.src=P["playlist.image"]
            }else{
            if(P.image){
                F.src=P.image
                }else{
                if(h.itemImage){
                    F.src=h.itemImage.src
                    }
                }
        }
    O.appendChild(J)
}
var E=l-L-K*2;
if(C<e.itemheight*d.length){
    E-=15
    }
    var D=document.createElement("div");
_css(D,{
    position:"relative",
    height:"100%",
    overflow:"hidden"
});
var G=document.createElement("span");
if(P.duration>0){
    G.className="duration";
    _css(G,{
        fontSize:(e.fontsize?e.fontsize:11)+"px",
        fontWeight:(e.fontweight?e.fontweight:"bold"),
        width:"40px",
        height:e.fontsize?e.fontsize+10:20,
        lineHeight:24,
        "float":"right",
        styleFloat:"right",
        cssFloat:"right"
    });
    G.innerHTML=_utils.timeFormat(P.duration);
    D.appendChild(G)
    }
    var N=document.createElement("span");
N.className="title";
_css(N,{
    padding:"5px 5px 0 "+(K?0:"5px"),
    height:e.fontsize?e.fontsize+10:20,
    lineHeight:e.fontsize?e.fontsize+10:20,
    overflow:"hidden",
    "float":"left",
    styleFloat:"left",
    cssFloat:"left",
    width:((P.duration>0)?E-50:E)-10+"px",
    fontSize:(e.fontsize?e.fontsize:13)+"px",
    fontWeight:(e.fontweight?e.fontweight:"bold")
    });
N.innerHTML=P?P.title:"";
D.appendChild(N);
if(P.description){
    var H=document.createElement("span");
    H.className="description";
    _css(H,{
        display:"block",
        "float":"left",
        styleFloat:"left",
        cssFloat:"left",
        margin:0,
        paddingLeft:N.style.paddingLeft,
        paddingRight:N.style.paddingRight,
        lineHeight:(e.fontsize?e.fontsize+4:16)+"px",
        overflow:"hidden",
        position:"relative"
    });
    H.innerHTML=P.description;
    D.appendChild(H)
    }
    O.appendChild(D);
return O
}
function s(E){
    x.innerHTML="";
    d=w.jwGetPlaylist();
    if(!d){
        return
    }
    items=[];
    f=p();
    for(var F=0;F<d.length;F++){
        var D=q(F);
        D.onclick=z(F);
        f.appendChild(D);
        items.push(D)
        }
        k=w.jwGetPlaylistIndex();
    o(k)();
    x.appendChild(f);
    if(_utils.isIOS()&&window.iScroll){
        f.style.height=e.itemheight*d.length+"px";
        var G=new iScroll(x.id)
        }
    }
function z(D){
    return function(){
        w.jwPlaylistItem(D);
        w.jwPlay(true)
        }
    }
function n(){
    f.scrollTop=w.jwGetPlaylistIndex()*e.itemheight
    }
    function v(){
    return e.thumbs.toString().toLowerCase()=="true"
    }
    function u(D){
    if(k>=0){
        o(k)();
        k=D.index
        }
        o(D.index)();
    n()
    }
    function m(){
    if(e.position==a.html5.view.positions.OVER){
        switch(w.jwGetState()){
            case a.api.events.state.IDLE:
                _show(x);
                break;
            default:
                _hide(x);
                break
                }
            }
}
function A(){
    for(var D in h){
        h[D]=t(D)
        }
    }
    function t(D){
    return w.skin.getSkinElement("playlist",D)
    }
    j();
return this
}
})(jwplayer);
(function(b){
    b.html5.playlistitem=function(d){
        var e={
            author:"",
            date:"",
            description:"",
            image:"",
            link:"",
            mediaid:"",
            tags:"",
            title:"",
            provider:"",
            file:"",
            streamer:"",
            duration:-1,
            start:0,
            currentLevel:-1,
            levels:[]
        };
        
        var c=b.utils.extend({},e,d);
        if(c.type){
            c.provider=c.type;
            delete c.type
            }
            if(c.levels.length===0){
            c.levels[0]=new b.html5.playlistitemlevel(c)
            }
            if(!c.provider){
            c.provider=a(c.levels[0])
            }else{
            c.provider=c.provider.toLowerCase()
            }
            return c
        };
        
    function a(e){
        if(b.utils.isYouTube(e.file)){
            return"youtube"
            }else{
            var f=b.utils.extension(e.file);
            var c;
            if(f&&b.utils.extensionmap[f]){
                if(f=="m3u8"){
                    return"video"
                    }
                    c=b.utils.extensionmap[f].html5
                }else{
                if(e.type){
                    c=e.type
                    }
                }
            if(c){
            var d=c.split("/")[0];
            if(d=="audio"){
                return"sound"
                }else{
                if(d=="video"){
                    return d
                    }
                }
        }
}
return""
}
})(jwplayer);
(function(a){
    a.html5.playlistitemlevel=function(b){
        var d={
            file:"",
            streamer:"",
            bitrate:0,
            width:0
        };
        
        for(var c in d){
            if(a.utils.exists(b[c])){
                d[c]=b[c]
                }
            }
        return d
    }
})(jwplayer);
(function(a){
    a.html5.playlistloader=function(){
        var c=new a.html5.eventdispatcher();
        a.utils.extend(this,c);
        this.load=function(e){
            a.utils.ajax(e,d,b)
            };
            
        function d(g){
            var f=[];
            try{
                var f=a.utils.parsers.rssparser.parse(g.responseXML.firstChild);
                c.sendEvent(a.api.events.JWPLAYER_PLAYLIST_LOADED,{
                    playlist:new a.html5.playlist({
                        playlist:f
                    })
                    })
                }catch(h){
                b("Could not parse the playlist")
                }
            }
        function b(e){
        c.sendEvent(a.api.events.JWPLAYER_ERROR,{
            message:e?e:"Could not load playlist an unknown reason."
            })
        }
    }
})(jwplayer);
(function(a){
    a.html5.skin=function(){
        var b={};
        
        var c=false;
        this.load=function(d,e){
            new a.html5.skinloader(d,function(f){
                c=true;
                b=f;
                e()
                },function(){
                new a.html5.skinloader("",function(f){
                    c=true;
                    b=f;
                    e()
                    })
                })
            };
            
        this.getSkinElement=function(d,e){
            if(c){
                try{
                    return b[d].elements[e]
                    }catch(f){
                    a.utils.log("No such skin component / element: ",[d,e])
                    }
                }
            return null
        };
        
    this.getComponentSettings=function(d){
        if(c){
            return b[d].settings
            }
            return null
        };
        
    this.getComponentLayout=function(d){
        if(c){
            return b[d].layout
            }
            return null
        }
    }
})(jwplayer);
(function(a){
    a.html5.skinloader=function(f,p,k){
        var o={};
        
        var c=p;
        var l=k;
        var e=true;
        var j;
        var n=f;
        var s=false;
        function m(){
            if(typeof n!="string"||n===""){
                d(a.html5.defaultSkin().xml)
                }else{
                a.utils.ajax(a.utils.getAbsolutePath(n),function(t){
                    try{
                        if(a.utils.exists(t.responseXML)){
                            d(t.responseXML);
                            return
                        }
                    }catch(u){
                    h()
                    }
                    d(a.html5.defaultSkin().xml)
                    },function(t){
                    d(a.html5.defaultSkin().xml)
                    })
            }
        }
    function d(y){
    var E=y.getElementsByTagName("component");
    if(E.length===0){
        return
    }
    for(var H=0;H<E.length;H++){
        var C=E[H].getAttribute("name");
        var B={
            settings:{},
            elements:{},
            layout:{}
    };
    
    o[C]=B;
    var G=E[H].getElementsByTagName("elements")[0].getElementsByTagName("element");
        for(var F=0;F<G.length;F++){
        b(G[F],C)
        }
        var z=E[H].getElementsByTagName("settings")[0];
        if(z&&z.childNodes.length>0){
        var K=z.getElementsByTagName("setting");
        for(var P=0;P<K.length;P++){
            var Q=K[P].getAttribute("name");
            var I=K[P].getAttribute("value");
            var x=/color$/.test(Q)?"color":null;
            o[C].settings[Q]=a.utils.typechecker(I,x)
            }
        }
        var L=E[H].getElementsByTagName("layout")[0];
    if(L&&L.childNodes.length>0){
        var M=L.getElementsByTagName("group");
        for(var w=0;w<M.length;w++){
            var A=M[w];
            o[C].layout[A.getAttribute("position")]={
                elements:[]
            };
            
            for(var O=0;O<A.attributes.length;O++){
                var D=A.attributes[O];
                o[C].layout[A.getAttribute("position")][D.name]=D.value
                }
                var N=A.getElementsByTagName("*");
            for(var v=0;v<N.length;v++){
                var t=N[v];
                o[C].layout[A.getAttribute("position")].elements.push({
                    type:t.tagName
                    });
                for(var u=0;u<t.attributes.length;u++){
                    var J=t.attributes[u];
                    o[C].layout[A.getAttribute("position")].elements[v][J.name]=J.value
                    }
                    if(!a.utils.exists(o[C].layout[A.getAttribute("position")].elements[v].name)){
                    o[C].layout[A.getAttribute("position")].elements[v].name=t.tagName
                    }
                }
            }
        }
e=false;
r()
}
}
function r(){
    clearInterval(j);
    if(!s){
        j=setInterval(function(){
            q()
            },100)
        }
    }
function b(y,x){
    var w=new Image();
    var t=y.getAttribute("name");
    var v=y.getAttribute("src");
    var A;
    if(v.indexOf("data:image/png;base64,")===0){
        A=v
        }else{
        var u=a.utils.getAbsolutePath(n);
        var z=u.substr(0,u.lastIndexOf("/"));
        A=[z,x,v].join("/")
        }
        o[x].elements[t]={
        height:0,
        width:0,
        src:"",
        ready:false,
        image:w
    };
    
    w.onload=function(B){
        g(w,t,x)
        };
        
    w.onerror=function(B){
        s=true;
        r();
        l()
        };
        
    w.src=A
    }
    function h(){
    for(var u in o){
        var w=o[u];
        for(var t in w.elements){
            var x=w.elements[t];
            var v=x.image;
            v.onload=null;
            v.onerror=null;
            delete x.image;
            delete w.elements[t]
        }
        delete o[u]
    }
    }
    function q(){
    for(var t in o){
        if(t!="properties"){
            for(var u in o[t].elements){
                if(!o[t].elements[u].ready){
                    return
                }
            }
            }
        }
    if(e===false){
    clearInterval(j);
    c(o)
    }
}
function g(t,v,u){
    if(o[u]&&o[u].elements[v]){
        o[u].elements[v].height=t.height;
        o[u].elements[v].width=t.width;
        o[u].elements[v].src=t.src;
        o[u].elements[v].ready=true;
        r()
        }else{
        a.utils.log("Loaded an image for a missing element: "+u+"."+v)
        }
    }
m()
}
})(jwplayer);
(function(a){
    a.html5.api=function(c,n){
        var m={};
        
        var f=document.createElement("div");
        c.parentNode.replaceChild(f,c);
        f.id=c.id;
        m.version=a.version;
        m.id=f.id;
        var l=new a.html5.model(m,f,n);
        var j=new a.html5.view(m,f,l);
        var k=new a.html5.controller(m,f,l,j);
        m.skin=new a.html5.skin();
        m.jwPlay=function(o){
            if(typeof o=="undefined"){
                e()
                }else{
                if(o.toString().toLowerCase()=="true"){
                    k.play()
                    }else{
                    k.pause()
                    }
                }
        };
    
m.jwPause=function(o){
    if(typeof o=="undefined"){
        e()
        }else{
        if(o.toString().toLowerCase()=="true"){
            k.pause()
            }else{
            k.play()
            }
        }
};

function e(){
    if(l.state==a.api.events.state.PLAYING||l.state==a.api.events.state.BUFFERING){
        k.pause()
        }else{
        k.play()
        }
    }
m.jwStop=k.stop;
m.jwSeek=k.seek;
m.jwPlaylistItem=k.item;
m.jwPlaylistNext=k.next;
m.jwPlaylistPrev=k.prev;
m.jwResize=k.resize;
m.jwLoad=k.load;
m.jwDetachMedia=k.detachMedia;
m.jwAttachMedia=k.attachMedia;
function h(o){
    return function(){
        return l[o]
        }
    }
function d(o,q,p){
    return function(){
        var r=l.plugins.object[o];
        if(r&&r[q]&&typeof r[q]=="function"){
            r[q].apply(r,p)
            }
        }
}
m.jwGetItem=h("item");
m.jwGetPosition=h("position");
m.jwGetDuration=h("duration");
m.jwGetBuffer=h("buffer");
m.jwGetWidth=h("width");
m.jwGetHeight=h("height");
m.jwGetFullscreen=h("fullscreen");
m.jwSetFullscreen=k.setFullscreen;
m.jwGetVolume=h("volume");
m.jwSetVolume=k.setVolume;
m.jwGetMute=h("mute");
m.jwSetMute=k.setMute;
m.jwGetStretching=function(){
    return l.stretching.toUpperCase()
    };
    
m.jwGetState=h("state");
m.jwGetVersion=function(){
    return m.version
    };
    
m.jwGetPlaylist=function(){
    return l.playlist
    };
    
m.jwGetPlaylistIndex=m.jwGetItem;
m.jwAddEventListener=k.addEventListener;
m.jwRemoveEventListener=k.removeEventListener;
m.jwSendEvent=k.sendEvent;
m.jwDockSetButton=function(r,o,p,q){
    if(l.plugins.object.dock&&l.plugins.object.dock.setButton){
        l.plugins.object.dock.setButton(r,o,p,q)
        }
    };

m.jwControlbarShow=d("controlbar","show");
m.jwControlbarHide=d("controlbar","hide");
m.jwDockShow=d("dock","show");
m.jwDockHide=d("dock","hide");
m.jwDisplayShow=d("display","show");
m.jwDisplayHide=d("display","hide");
m.jwGetLevel=function(){};

m.jwGetBandwidth=function(){};

m.jwGetLockState=function(){};

m.jwLock=function(){};

m.jwUnlock=function(){};

function b(){
    if(l.config.playlistfile){
        l.addEventListener(a.api.events.JWPLAYER_PLAYLIST_LOADED,g);
        l.loadPlaylist(l.config.playlistfile)
        }else{
        if(typeof l.config.playlist=="string"){
            l.addEventListener(a.api.events.JWPLAYER_PLAYLIST_LOADED,g);
            l.loadPlaylist(l.config.playlist)
            }else{
            l.loadPlaylist(l.config);
            setTimeout(g,25)
            }
        }
}
function g(o){
    l.removeEventListener(a.api.events.JWPLAYER_PLAYLIST_LOADED,g);
    l.setupPlugins();
    j.setup();
    var o={
        id:m.id,
        version:m.version
        };
        
    k.playerReady(o)
    }
    if(l.config.chromeless&&!a.utils.isIOS()){
    b()
    }else{
    m.skin.load(l.config.skin,b)
    }
    return m
}
})(jwplayer)
};