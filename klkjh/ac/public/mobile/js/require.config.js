requirejs.config({ //配置
    baseUrl: '/public/mobile/js',
    paths: {
        jquery: 'jquery-2.1.1.min',
        alerttoshow:'alertpopshow'
    },
    shim:{
        common:["jquery"]      
    },
    map: {
        '*': {
            'css': '../require-css/css'
        }
    }
});  
