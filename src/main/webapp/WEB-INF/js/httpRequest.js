/**반복적 코드 분리해둔것*/

var XHR=null;

function getXHR(){
	if(window.ActionXObject){
		return new ActiveXObject('Msxml2.XMLHTTP');
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();	
	}else{
		return null;
	}
}

function sendRequest(url,params,callback,method){
	
	XHR=getXHR();
	
	var httpMethod=method?method:'GET';
	if(httpMethod !='GET' && httpMethod!='POST'){
		httpMethod='GET';
	
	}
	var httpParams=(params==null||params=='')?null:params;
	
	var httpUrl=url;
	if(httpMethod=='GET' && httpParams!=null){
		httpUrl=httpUrl+'?'+httpParams;
	}
	XHR.onreadystatechange=callback;
	XHR.open(httpMethod,httpUrl,true);
	XHR.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	XHR.send(httpMethod=='POST'?httpParams:null);
}
