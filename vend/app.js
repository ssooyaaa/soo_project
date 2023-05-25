const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});


var beverages = {
    '콜라':{
        price:1000,
        count:1
    },
    '사이다':{
        price:1100,
        count:10
    },
    '환타':{
        price:1200,
        count:10
    },
    '제로콜라':{
        price:1700,
        count:10
    },

}


function consoleVendingState(){
    console.log('');
    console.log('');
    console.log(`
#    # ###### #    # #####  # #    #  ####     #    #   ##    ####  #    # # #    # ###### 
#    # #      ##   # #    # # ##   # #    #    ##  ##  #  #  #    # #    # # ##   # #      
#    # #####  # #  # #    # # # #  # #         # ## # #    # #      ###### # # #  # #####  
#    # #      #  # # #    # # #  # # #  ###    #    # ###### #      #    # # #  # # #      
 #  #  #      #   ## #    # # #   ## #    #    #    # #    # #    # #    # # #   ## #      
  ##   ###### #    # #####  # #    #  ####     #    # #    #  ####  #    # # #    # ######`
);
    console.log('');
    console.log('===============메뉴===============');
    console.log('  콜라 | 사이다 |  환타  | 제로콜라');
    console.log('');
    console.log('===============가격===============');
    console.log(`${beverages['콜라']['price']} 원| ${beverages['사이다']['price']} 원| ${beverages['환타']['price']} 원| ${beverages['제로콜라']['price']} 원`);
    console.log('');
    console.log('===============수량===============');
    console.log(` ${beverages['콜라']['count']} 개  |  ${beverages['사이다']['count']} 개 |  ${beverages['환타']['count']} 개 |  ${beverages['제로콜라']['count']} 개`);
    console.log('');
    console.log('');
}


consoleVendingState();


var buy = function(){
    rl.question("음료를 골라 주세요(예:콜라) : ", (beverage) => {
        // 한 줄씩 입력받은 후 실행할 코드
        // 입력된 값은 line에 저장된다.
        console.log(`${beverage}를 선택했습니다.`);
        console.log('');

        if(beverages[beverage] == undefined){
            console.log('선택하신 음료가 존재하지 않습니다.');
            console.log('');
            buy();
            return;
        }

        //수량 체크
        var count = beverages[beverage]['count'];

        if(count>0){

            rl.question('동전을 넣어주세요(예:1000) : ',(money)=>{
                console.log('');
    
                //가격
                var price = beverages[beverage]['price'];
    
                if(money>=price){
                    //수량 -1
                    count = count-1;
                    beverages[beverage]['count'] = count;

                    var change = money-price;

                    console.log(`잔돈 : ${change} 원`);
                    console.log('');
                    console.log('');

                    consoleVendingState();
                    buy();
                }else{
                    var more = price-money;

                    rl.question(`${more}원이 부족합니다. 동전을 더 넣어주세요.(${more}원 보다 작을 시, 구매 취소) : `,(plusMoney)=>{

                        if(plusMoney>=more){
                            //수량-1
                            count = count-1;
                            beverages[beverage]['count'] = count;

                            var change = plusMoney-more;

                            console.log(`잔돈 : ${change} 원`);
                            console.log('');
                            console.log('');

                            consoleVendingState();
                            buy();
                        } else{
                            console.log('');
                            console.log('');
                            consoleVendingState();
                            buy();
                        }
                    })
                }
                    
            });
        }else{
            console.log(`${beverage} 재고가 부족합니다. 다른 음료를 선택해주세요.`);
            console.log('');
            console.log('');
            consoleVendingState();
            buy();
        }

        
       
    });
    
}

buy();



