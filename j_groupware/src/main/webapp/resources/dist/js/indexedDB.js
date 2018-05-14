window.indexedDB = window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || 
window.msIndexedDB;
 
window.IDBTransaction = window.IDBTransaction || window.webkitIDBTransaction || 
window.msIDBTransaction;
window.IDBKeyRange = window.IDBKeyRange || 
window.webkitIDBKeyRange || window.msIDBKeyRange

if (!window.indexedDB) {
   window.alert("Your browser doesn't support a stable version of IndexedDB.")
}

const DB_NAME = 'jgroupware-indexeddb-chatting';
const DB_VERSION = 1; // Use a long long for this value (don't use a float)
const DB_STORE_NAME = 'chatting';

const chattingData = [
    { id: "00-01", name: "gopal", age: 35, email: "gopal@tutorialspoint.com" },
    { id: "00-02", name: "prasad", age: 32, email: "prasad@tutorialspoint.com" }
 ];
var db;
var request = window.indexedDB.open(DB_NAME, DB_VERSION);

request.onerror = function(event) {
    console.log("error: ");
 };

request.onsuccess = function(event) {
    db = request.result;
    console.log("success: "+ db);
};

request.onupgradeneeded = function(event) {
     var db = event.target.result;
     var store = event.currentTarget.result.createObjectStore(
    	        DB_STORE_NAME, { keyPath: 'chat_num', autoIncrement: true });
//     var objectStore = db.createObjectStore("chatting", { autoIncrement : true });
      store.createIndex('acnt_id', 'acnt_id', { unique: false });
//    store.createIndex('name', 'name', { unique: false });
    
     
}

function getObjectStore(store_name, mode) {
    var tx = db.transaction(store_name, mode);
    return tx.objectStore(store_name);
}

function read(acnt_id) {
	
	var objectStore = getObjectStore(DB_STORE_NAME,'readonly');
//  var objectStore = db.transaction("chatting").objectStore("chatting");
	var index = objectStore.index('acnt_id');
	var singleKeyRange = IDBKeyRange.only(acnt_id);
	index.openCursor(singleKeyRange).onsuccess = function(event) {
      var cursor = event.target.result;
      if (cursor) {
//    	alert('cursor.value.username : '+cursor.value.username);
    	if(user_name === cursor.value.username){
    		showChatlistInDB({acnt_id:cursor.key, name:cursor.value.name, message:cursor.value.message, chatDate:cursor.value.chatDate});            	
    	}   
    	cursor.continue();
     } else {
        console.log("No more entries!");
     }
  };
 } 
 
function readAll() {
    var objectStore = db.transaction("chatting").objectStore("chatting");
    
    objectStore.openCursor().onsuccess = function(event) {
       var cursor = event.target.result;
       
       if (cursor) {
    	   alert("Name for key " + cursor.key + " acnt_id : " + cursor.value.acnt_id + ', name : ' + cursor.value.name + ", message : " + cursor.value.message + ", chatDate: " + cursor.value.chatDate +", username: "+cursor.value.username);
          cursor.continue();
       } else {
          alert("No more entries!");
       }
    };
}

function add(chat) {
	var objectStore = getObjectStore(DB_STORE_NAME,'readwrite');
//	var request = db.transaction(["chatting"], "readwrite")
//	  .objectStore("chatting")
	  objectStore.add(chat);
	   //{ id: "03", name: "prasad", age: 24, email: "prasad@tutorialspoint.com" }
	   
	   request.onsuccess = function(event) {
	      alert("The Data has been added to your database.");
	   };
	   
	   request.onerror = function(event) {
	      alert("Unable to add data\r\nPrasad is already exist in your database! ");
	   }
}
function remove() {
//	for(var i=2;i<=38;i+=1){
//		
//	}	
	var request = db.transaction(DB_STORE_NAME, "readwrite")
	   .objectStore(DB_STORE_NAME)
	   .delete();
	
	   request.onsuccess = function(event) {
	      alert("prasad entry has been removed from your database.");
	   };
	}