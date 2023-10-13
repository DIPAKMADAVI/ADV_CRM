
//alert ("app.js")

import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"
import 'jquery';
import "script";



import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';
import { Turbo } from '@hotwired/turbo-rails';

const application = Application.start();
const context = require.context('../controllers', true, /\.js$/);
application.load(definitionsFromContext(context));
Turbo.start();

        // const menuBar = document.querySelector('.icc');
        // const sidebar = document.getElementById('sidebar');
        // const menuside = document.getElementById('mainsection')
        // const maincontentpg = document.getElementById('maincontentpage')
        // const headercontent = document.getElementById('content')
        
        // menuBar.addEventListener('click', function(){
        //     sidebar.classList.toggle('hide');
            
        // })
        
        // var clicktoggle = 1;
        // menuBar.addEventListener('click', function(){
        //     if(clicktoggle){
        //         menuside.style.width = 'calc(100% - 80px)'
        //         menuside.style.left = '80px'
        
        //         maincontentpg.style.width = 'calc(100% - 80px)'
        //         maincontentpg.style.left = '80px'
        
        //         headercontent.style.width = 'calc(100% - 80px)'
        //         headercontent.style.left = '80px'
        
        //         clicktoggle =0;
        //     }else{
        //         menuside.style.width = 'calc(100% - 280px)'
        //         menuside.style.left = '280px'
        
        //         maincontentpg.style.width = 'calc(100% - 280px)'
        //         maincontentpg.style.left = '280px'
        
        //         headercontent.style.width = 'calc(100% - 280px)'
        //         headercontent.style.left = '280px'
        //         clicktoggle=1
        //     }
        // })
        
     
