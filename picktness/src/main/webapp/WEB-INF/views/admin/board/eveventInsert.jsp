<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>�대깽�� �깅���湲�</title>
    
      <style>
       .board_inner {
            position: relative;
            width: 1100px;
            margin: 0 auto;
          }
          
          .file_input{
            margin-left: 50px;
          
          }
          
    
    
    
    .btn_right {
    float:right;
    
    
    }
    .btn_margin{
    
      margin-right:150px;
    }
    #file {
      display: none;
    }
          .file-label {
      margin-top: 30px;
      background-color: #5b975b;
      color: #fff;
      text-align: center;
      padding: 10px 0;
      width: 65%;
      border-radius: 6px;
      cursor: pointer;
    }
    .file {
      display: none;
    }
          .divider {
        border-top: 1px solid #ccc;
        margin-top: 20px;
        margin-bottom: 20px;
      }
      textarea{
        width: 80%;
          resize:none;
          height: 350px;
          font-size: 17px;
        }
      .center {
          text-align: center;
      }
    .content{
    display: flex;
    
    
    }
    .btn{
      background-color: skyblue;
      color: white;
      border: none;
      float:right;
      
    }
    p span {
    margin-right:10px;
    
    }
    .content span{
      margin-right:10px;
    }
    .span1{
    float:right;
    }
      </style>
      
    
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
    var cnt=1;
    
    function back() {
        
        history.go(-1); 
    
    }
    
    
    </script>
    </head>
    <body>
    <div class ="board_inner">
    <h1>湲��곌린</h1>
    <form method="post" action="${contextPath}/upload" enctype="multipart/form-data">
          <p><span style="font-size: 20px;">��紐�</span> <input type="text" placeholder="��紐⑹�� ���ν�� 二쇱�몄��." name="title" style="width: 80%; height: 30px; font-size: 17px;"></p>
          <p><span style="font-size: 20px;">��洹�</span> <input type="text" name="hasTag" placeholder="#�ㅼ�댁�� #�ㅻ������" name="title" style="width: 80%; height: 30px; font-size: 17px;"></p>
          <p class="content"><span style="font-size: 20px;">�댁��</span> <textarea style="margin-left: 5px;" placeholder="�댁�⑹�� ���ν�� 二쇱�몄��." name="content" style="width: 80%; margin-bottom: 50px;"></textarea></p>
        <tr>
            
            <td colspan="3">
                <div class="file_list">
                    <div>
                        <span class="file_input">
                            
                            <label> 泥⑤�����
                                <input type="file" name="files" onchange="selectFile(this);" />
                            </label>
                        </span>
                        <span class= "btn_right">
                        <button type="button" onclick="back()" class="btns del_btn"><span>����媛�湲�</span></button>
                        <button class= "btn_margin" type="submit" onclick="addFile();" class="btns fn_add_btn"><span>�깅���湲�</span></button>
                      </span>
                      </div>
                </div>
            </td>
        </tr>
    <div id="root">
    </div>
    </form>
    
    </body>
    </html>