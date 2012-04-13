var _width;
var _height;
function _resize(capheight){
	if(!capheight)
		capheight=50;
	if(_lookupDiv!=undefined){
		var _div=_lookupDiv(document.body)[0];
		var _rptname = _div.id.substr(0,_div.id.indexOf( "_scrollArea" ));
		
		var _left = document.getElementById(_rptname+"_$_left");
		var _top = document.getElementById(_rptname+"_$_top");
		var _content = document.getElementById(_rptname);
		if(_width==undefined){
			_width=((_left==undefined)?0:parseInt(_left.style.width))+
				((_content==undefined)?0:parseInt(_content.style.width));
		}
		if(_height==undefined){
			_height=((_left==undefined)?0:parseInt(_left.style.height))+
				((_content==undefined)?0:parseInt(_content.style.height));
		}
		if(document.body.clientWidth-40>_width){
			_div.style.width=_width+20;
		}else{
			_div.style.width=document.body.clientWidth-20;
		}
		if(document.body.clientHeight-capheight-20>_height){
			_div.style.height=_height+20;
		}else{
			_div.style.height=document.body.clientHeight-capheight;
		}
	}
}

function _fixheight(capheight){
	if(!capheight)
		capheight=100;
	if(_lookupDiv!=undefined){
		var _div=_lookupDiv(document.body)[0];
		_div.style.width="100%";
		_div.style.height=document.body.clientHeight-capheight;
	}
}