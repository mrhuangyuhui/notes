# [第五章、Linux 的檔案權限與目錄配置](http://linux.vbird.org/linux_basic/0210filepermission.php)

> 在我們Linux系統當中，預設的情況下，所有的系統上的帳號與一般身份使用者，還有那個root的相關資訊， 都是記錄在/etc/passwd這個檔案內的。至於個人的密碼則是記錄在/etc/shadow這個檔案下。 此外，Linux所有的群組名稱都紀錄在/etc/group內！

> - chgrp ：改變檔案所屬群組
> - chown ：改變檔案擁有者
> - chmod ：改變檔案的權限, SUID, SGID, SBIT等等的特性

修改文件的所属群组
```bash
chgrp users initial-setup-ks.cfg
```

修改文件的所有者
```bash
chown bin initial-setup-ks.cfg
```

同时修改文件的所有者和所属群组
```bash
chown root:root initial-setup-ks.cfg
```

> 數字類型改變檔案權限
> 
> Linux檔案的基本權限就有九個，分別是owner/group/others三種身份各有自己的read/write/execute權限， 先複習一下剛剛上面提到的資料：檔案的權限字元為：『-rwxrwxrwx』， 這九個權限是三個三個一組的！其中，我們可以使用數字來代表各個權限，各權限的分數對照表如下：
> ```
> r:4
> w:2
> x:1
> ```
> 
> 每種身份(owner/group/others)各自的三個權限(r/w/x)分數是需要累加的，例如當權限為： [-rwxrwx---] 分數則是：
> ```
> owner = rwx = 4+2+1 = 7
> group = rwx = 4+2+1 = 7
> others= --- = 0+0+0 = 0
> ```
> 

用数字修改文件的权限
```bash
chmod 777 .bashrc
```

> 符號類型改變檔案權限
> 
> 還有一個改變權限的方法呦！從之前的介紹中我們可以發現，基本上就九個權限分別是(1)user (2)group (3)others三種身份啦！那麼我們就可以藉由u, g, o來代表三種身份的權限！此外， a 則代表 all 亦即全部的身份！那麼讀寫的權限就可以寫成r, w, x囉！也就是可以使用底下的方式來看：
> 
> <html>
> <table class="news" style="width: 85%">
> 		<tr style="text-align:center">
> 		<td>chmod</td><td>u<br />g<br />o<br />a</td>
> 		<td style="font: 11pt '細明體'">+(加入)<br />-(除去)<br />=(設定)</td>
> 		<td>r<br />w<br />x</td><td>檔案或目錄</td></tr></table><br />
> </html>

用符号修改文件的权限
```bash
chmod u=rwx,go=rx .bashrc
chmod a+w .bashrc
chmod a-x .bashrc
```

> 權限對檔案的重要性
>
> 檔案是實際含有資料的地方，包括一般文字檔、資料庫內容檔、二進位可執行檔(binary program)等等。 因此，權限對於檔案來說，他的意義是這樣的：
> 
> - r (read)：可讀取此一檔案的實際內容，如讀取文字檔的文字內容等；
> - w (write)：可以編輯、新增或者是修改該檔案的內容(但不含刪除該檔案)；
> - x (eXecute)：該檔案具有可以被系統執行的權限。

> 權限對目錄的重要性
>
> 檔案是存放實際資料的所在，那麼目錄主要是儲存啥玩意啊？目錄主要的內容在記錄檔名清單，檔名與目錄有強烈的關連啦！ 所以如果是針對目錄時，那個 r, w, x 對目錄是什麼意義呢？
> 
> - r (read contents in directory)：
> 
> 表示具有讀取目錄結構清單的權限，所以當你具有讀取(r)一個目錄的權限時，表示你可以查詢該目錄下的檔名資料。 所以你就可以利用 ls 這個指令將該目錄的內容列表顯示出來！
> 
> - w (modify contents of directory)：
> 
> 這個可寫入的權限對目錄來說，是很了不起的！ 因為他表示你具有異動該目錄結構清單的權限，也就是底下這些權限：
> 
> 建立新的檔案與目錄；
> 刪除已經存在的檔案與目錄(不論該檔案的權限為何！)
> 將已存在的檔案或目錄進行更名；
> 搬移該目錄內的檔案、目錄位置。
> 
> 總之，目錄的w權限就與該目錄底下的檔名異動有關就對了啦！
> 
> - x (access directory)：
> 
> 咦！目錄的執行權限有啥用途啊？目錄只是記錄檔名而已，總不能拿來執行吧？沒錯！目錄不可以被執行，目錄的x代表的是使用者能否進入該目錄成為工作目錄的用途！ 所謂的工作目錄(work directory)就是你目前所在的目錄啦！舉例來說，當你登入Linux時， 你所在的家目錄就是你當下的工作目錄。而變換目錄的指令是『cd』(change directory)囉！