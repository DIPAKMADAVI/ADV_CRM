// Import and register all your controllers from the importmap under controllers/*

// import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
// import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
// eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)




// const menuBar = document.querySelector('.icc');
// const sidebar = document.getElementById('sidebar');
// const menuside = document.getElementById('mainsection')
// menuBar.addEventListener('click', function(){
//     sidebar.classList.toggle('hide');
    
// })
//alert ("index")
// var clicktoggle = 1;
// menuBar.addEventListener('click', function(){
//     if(clicktoggle){
//         menuside.style.width = 'calc(100% - 80px)'
//         menuside.style.left = '80px'
//         clicktoggle =0;
//     }else{
//         menuside.style.width = 'calc(100% - 280px)'
//         menuside.style.left = '280px'
//         clicktoggle=1
//     }
// })

// const allSideMenu = document.querySelectorAll('#sidebar .side-menu li a');

// allSideMenu.forEach(item=>{
//     const li = item.parentElement;

//     item.addEventListener('click', function(){
//         allSideMenu.forEach(i=>{
//             i.parentElement.classList.remove('active');
//         })
//         li.classList.add('active');
//     })
// })




