
//html2
let datas = [
    {"id":"id01","name":"james1"},
    {"id":"id02","name":"james2"},
    {"id":"id03","name":"james3"},
    {"id":"id04","name":"james4"},
    {"id":"id05","name":"james5"}
];
let html2={
    init:function (){
        $('#btn').click(function(){
            html2.display(datas);
        });
    },
    display:function(datas){
        let result = '';
        $(datas).each(function(index,data){
            result+= '<tr>';
            result+= '<td>'+data.id +'</td>';
            result+= '<td>'+data.name+'</td>';
            result+= '</tr>';
        });
        // $(datas).each(function(index,data){
        //     result+= '<h3>';
        //     result+= data.id + ' ' + data.name;
        //     result+= '</h3>';
        // });
        // $(result).html(result);
        $('#cust_tb > tbody').html(result);
    }

};

//login

let login = {
    init:function(url){
        this.url = url;
        $('#login_form>button').click(function(){
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            //html 사이의 text는 .text()로 가져오고 form데이터는 .val()로 가져온다.
            if(id==''||id==null){
                alert('ID를 입력 하세요');
                $('#id').focus();
                return;
            }
            if(pwd==''||pwd==null){
                alert('pwd를 입력 하세요');
                $('#pwd').focus();
                return;
            }
            login.send();
        });
    },
    send:function(){
        $('#login_form').attr({
            'method':'post',
            'action':this.url
        });//html의 attribute는 태그 안에 들어가는 속성
        $('#login_form').submit();
    }
};

//register
let register = {
    init:function(url){
        this.url = url;
        $('#register_form>button').click(function(){
            let id = $('#id').val();
            let pwd = $('#pwd').val();
            let name = $('#name').val();
            //html 사이의 text는 .text()로 가져오고 form데이터는 .val()로 가져온다.
            if(id==''||id==null){
                alert('ID를 입력 하세요');
                $('#id').focus();
                return;
            }
            if(pwd==''||pwd==null){
                alert('pwd를 입력 하세요');
                $('#pwd').focus();
                return;
            }
            if(name==''||name==null){
                alert('name 입력 하세요');
                $('#name').focus();
                return;
            }
            register.send();
        });
    },
    send:function(){
        $('#register_form').attr({
            'method':'post',
            'action':this.url
        });//html의 attribute는 태그 안에 들어가는 속성
        $('#register_form').submit();
    }
};