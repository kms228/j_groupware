window.indexedDB = window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || 
window.msIndexedDB;
 
window.IDBTransaction = window.IDBTransaction || window.webkitIDBTransaction || 
window.msIDBTransaction;
window.IDBKeyRange = window.IDBKeyRange || 
window.webkitIDBKeyRange || window.msIDBKeyRange

//if (window.indexedDB) {
//	   window.alert("Your browser support a stable version of IndexedDB.")
//}
if (!window.indexedDB) {
   window.alert("Your browser doesn't support a stable version of IndexedDB.")
}

const chattingData = [
    { id: "00-01", name: "gopal", age: 35, email: "gopal@tutorialspoint.com" },
    { id: "00-02", name: "prasad", age: 32, email: "prasad@tutorialspoint.com" }
 ];
var db;
var request = window.indexedDB.open("superDatabase", 2);

request.onerror = function(event) {
    console.log("error: ");
 };

request.onsuccess = function(event) {
    db = request.result;
    console.log("success: "+ db);
};

request.onupgradeneeded = function(event) {
     var db = event.target.result;
     var objectStore = db.createObjectStore("chatting", {keyPath: "id"});
     
//     for (var i in chattingData) {
//        objectStore.add(chattingData[i]);
//     }
}

function read() {
    var transaction = db.transaction(["chatting"]);
    var objectStore = transaction.objectStore("chatting");
    var request = objectStore.get("00-03");
    
    request.onerror = function(event) {
       alert("Unable to retrieve daa from database!");
    };
    
    request.onsuccess = function(event) {
       // Do something with the request.result!
       if(request.result) {
          alert("Name: " + request.result.name + ", Age: " + request.result.age + ", Email: " + request.result.email);
       } else {
          alert("Kenny couldn't be found in your database!");
       }
    };
 } 
 
function readAll() {
    var objectStore = db.transaction("chatting").objectStore("chatting");
    
    objectStore.openCursor().onsuccess = function(event) {
       var cursor = event.target.result;
       
       if (cursor) {
          alert("Name for id " + cursor.key + " is " + cursor.value.name + ", Age: " + cursor.value.age + ", Email: " + cursor.value.email);
          cursor.continue();
       } else {
          alert("No more entries!");
       }
    };
}

function add() {
	   var request = db.transaction(["chatting"], "readwrite")
	   .objectStore("chatting")
	   .add({ id: "03", name: "prasad", age: 24, email: "prasad@tutorialspoint.com" });
	   
	   request.onsuccess = function(event) {
	      alert("Prasad has been added to your database.");
	   };
	   
	   request.onerror = function(event) {
	      alert("Unable to add data\r\nPrasad is already exist in your database! ");
	   }
}
function remove() {
	   var request = db.transaction(["chatting"], "readwrite")
	   .objectStore("chatting")
	   .delete("00-01");
	   
	   request.onsuccess = function(event) {
	      alert("prasad entry has been removed from your database.");
	   };
	}