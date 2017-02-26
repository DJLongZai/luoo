/**
 * Created by frank on 2016/11/18.
 */

/**
 * Created by Administrator on 2016/11/17.
 */
function getStyle(obj,attr)
{
    if(obj.currentStyle)
    {
        return obj.currentStyle[attr];
    }
    else
    {
        return getComputedStyle(obj,false)[attr];
    }
}
function starMover(obj,json,fn)
{
    clearInterval(obj.timer);
    obj.timer=setInterval(function()
    {
        var Bstop=true;
        for(var attr in json)
        {
            var icur=0;
            if(attr=='opacity')
            {
                icur=parseFloat(getStyle(obj,attr))*100;
            }
            else
            {
                icur=parseInt(getStyle(obj,attr));
            }
            var ispeed=(json[attr]-icur)/8;
            ispeed=ispeed>0?Math.ceil(ispeed):Math.floor(ispeed);
            if(icur!=json[attr])
            {
                Bstop=false;
            }
            if(attr=='opacity')
                {
                    icur+=ispeed;
                    obj.style[attr]=icur/100;
                }
                else
                {
                    obj.style[attr]=icur+ispeed+'px';
                }
        }
                if(Bstop)
                {
                    clearInterval(obj.timer);
                    if(fn)
                    {
                        fn();
                    }
                }
    },30);
}
function myadd(obj,sevent,fu){
    if(obj.attachEvent){
        obj.attachEvent('on'+sevent,fu);
    }else{
        obj.addEventListener(sevent,fu,false);
    }
}
function list(obj,top){
    myadd(window,'scroll' , function(){

        if(document.body.scrollTop>=top){
            obj.style.position = "fixed";
            obj.style.top = "0"+"px";
        }else {
            obj.style.position = "";
            obj.style.top = "";
        }
    });
}


function Top(obj,top){
    myadd(window,'scroll' , function(){

        if(document.body.scrollTop>=top){
            obj.style.display = "block";
        }else {
            obj.style.display = "none";
        }
    });
}
function Top_btn_onclick(obj){
    obj.onclick = function(){
        document.body.scrollTop = 0;
    }
}

