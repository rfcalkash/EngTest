import QtQuick.Controls.Material
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

GenericPage {

    function init(){
        corrects=0
        inCorrects=0
        currentAnswer=""
        picturesQuestions=[]
        picturesItems.forEach(item=>{
                                  prepositions.forEach(prep=>{
                                                           picturesQuestions.push({item:item,prep:prep})
                                                       })
                              })
        questionsOrder=Array.from({length:picturesQuestions.length},(v,i)=>({source:0,index:i}))
        questionsOrder.push(...Array.from({length:numbersQuestions.length},(v,i)=>({source:1,index:i})))
        questionsOrder.push(...Array.from({length:presentSimpleQuestions.length},(v,i)=>({source:2,index:i})))
        questionsOrder.push(...Array.from({length:presentContinuousQuestions.length},(v,i)=>({source:3,index:i})))
        questionsOrder.push(...Array.from({length:pronounsQuestions.length},(v,i)=>({source:4,index:i})))
        questionsOrder.push(...Array.from({length:thereIsThisIsQuestions.length},(v,i)=>({source:5,index:i})))
        questionsLeft=questionsOrder.length
        shuffleArray(questionsOrder)
    }

    property var picturesItems: [
        {word:"camera", image:"qrc:/images/words/camera.png"},
        {word:"CDs", image:"qrc:/images/words/cds.png"},
        {word:"gloves", image:"qrc:/images/words/gloves.png"},
        {word:"guitar", image:"qrc:/images/words/guitar.png"},
        {word:"hairbrush", image:"qrc:/images/words/hairbrush.png"},
        {word:"helmet", image:"qrc:/images/words/helmet.png"},
        {word:"keys", image:"qrc:/images/words/keys.png"},
        {word:"mobile phone", image:"qrc:/images/words/mobile phone.png"},
        {word:"roller blades", image:"qrc:/images/words/roller blades.png"},
        {word:"watch", image:"qrc:/images/words/watch.png"}
    ]

    property var prepositions: [
        {word:"in", boxHAlignment:Qt.AlignHCenter, itemHAlignment:Qt.AlignHCenter, itemVOffset:-0.5,boxFZ:2,boxBZ:0,itemZ:1},
        {word:"on", boxHAlignment:Qt.AlignHCenter, itemHAlignment:Qt.AlignHCenter, itemVOffset:-1,boxFZ:2,boxBZ:0,itemZ:1},
        {word:"under", boxHAlignment:Qt.AlignHCenter, itemHAlignment:Qt.AlignHCenter, itemVOffset:1,boxFZ:2,boxBZ:0,itemZ:1},
        {word:"behind", boxHAlignment:Qt.AlignHCenter, itemHAlignment:Qt.AlignHCenter, itemVOffset:-0.5,boxFZ:2,boxBZ:1,itemZ:0},
        {word:"next to", boxHAlignment:Qt.AlignLeft, itemHAlignment:Qt.AlignRight, itemVOffset:0,boxFZ:2,boxBZ:0,itemZ:1},
        {word:"in front of", boxHAlignment:Qt.AlignHCenter, itemHAlignment:Qt.AlignHCenter, itemVOffset:0.5,boxFZ:1,boxBZ:0,itemZ:2}
    ]

    property var numbersQuestions: [
        {question: "Один", key: "One"},
        {question: "Два", key: "Two"},
        {question: "Три", key: "Three"},
        {question: "Четыре", key: "Four"},
        {question: "Пять", key: "Five"},
        {question: "Шесть", key: "Six"},
        {question: "Семь", key: "Seven"},
        {question: "Восемь", key: "Eight"},
        {question: "Девять", key: "Nine"},
        {question: "Десять", key: "Ten"},
        {question: "Одиннадцать", key: "Eleven"},
        {question: "Двенадцать", key: "Twelve"},
        {question: "Тринадцать", key: "Thirteen"},
        {question: "Четырнадцать", key: "Fourteen"},
        {question: "Пятнадцать", key: "Fifteen"},
        {question: "Шестнадцать", key: "Sixteen"},
        {question: "Семнадцать", key: "Seventeen"},
        {question: "Восемнадцать", key: "Eighteen"},
        {question: "Девятнадцать", key: "Nineteen"},
        {question: "Двадцать", key: "Twenty"}
    ];

    property var presentSimpleQuestions: [
        {rus: "Я читаю книги каждый день", eng: "I ... books every day", key: "read"},
        {rus: "Она работает в офисе", eng: "She ... in an office", key: "works"},
        {rus: "Мы играем в футбол по выходным", eng: "We ... football on weekends", key: "play"},
        {rus: "Он изучает английский язык", eng: "He ... English", key: "studies"},
        {rus: "Они живут в большом городе", eng: "They ... in a big city", key: "live"},
        {rus: "Моя сестра готовит очень хорошо", eng: "My sister ... very well", key: "cooks"},
        {rus: "Мы встаем рано утром", eng: "We ... up early in the morning", key: "get"},
        {rus: "Дети идут в школу каждый день", eng: "Children ... to school every day", key: "go"},
        {rus: "Она любит мороженое", eng: "She ... ice cream", key: "likes"},
        {rus: "Мой отец водит машину", eng: "My father ... a car", key: "drives"},
        {rus: "Мы смотрим телевизор вечером", eng: "We ... TV in the evening", key: "watch"},
        {rus: "Кот спит на диване", eng: "The cat ... on the sofa", key: "sleeps"},
        {rus: "Я пью кофе утром", eng: "I ... coffee in the morning", key: "drink"},
        {rus: "Она поет в хоре", eng: "She ... in the choir", key: "sings"},
        {rus: "Мы покупаем продукты в супермаркете", eng: "We ... groceries at the supermarket", key: "buy"},
        {rus: "Он бегает в парке", eng: "He ... in the park", key: "runs"},
        {rus: "Они говорят по-французски", eng: "They ... French", key: "speak"},
        {rus: "Я делаю домашнее задание каждый вечер", eng: "I ... homework every evening", key: "do"},
        {rus: "Она носит красивые платья", eng: "She ... beautiful dresses", key: "wears"},
        {rus: "Мы путешествуем летом", eng: "We ... in summer", key: "travel"},
        {rus: "Собака лает на незнакомцев", eng: "The dog ... at strangers", key: "barks"},
        {rus: "Я помогаю маме по дому", eng: "I ... my mother with housework", key: "help"},
        {rus: "Он играет на гитаре", eng: "He ... the guitar", key: "plays"},
        {rus: "Мы обедаем в 12 часов", eng: "We ... lunch at 12 o'clock", key: "have"},
        {rus: "Она танцует очень красиво", eng: "She ... very beautifully", key: "dances"},
        {rus: "Я пишу письма друзьям", eng: "I ... letters to friends", key: "write"},
        {rus: "Они работают в саду", eng: "They ... in the garden", key: "work"},
        {rus: "Мой брат играет в теннис", eng: "My brother ... tennis", key: "plays"},
        {rus: "Мы идем в театр по субботам", eng: "We ... to the theatre on Saturdays", key: "go"},
        {rus: "Она читает газету утром", eng: "She ... the newspaper in the morning", key: "reads"},
        {rus: "Я слушаю музыку перед сном", eng: "I ... to music before bed", key: "listen"},
        {rus: "Он учит новые слова", eng: "He ... new words", key: "learns"},
        {rus: "Мы встречаемся с друзьями", eng: "We ... friends", key: "meet"},
        {rus: "Она покупает одежду в торговом центре", eng: "She ... clothes at the mall", key: "buys"},
        {rus: "Я забочусь о своих растениях", eng: "I ... for my plants", key: "care"},
        {rus: "Они едят фрукты каждый день", eng: "They ... fruit every day", key: "eat"},
        {rus: "Он строит дом", eng: "He ... a house", key: "builds"},
        {rus: "Мы плаваем в бассейне", eng: "We ... in the pool", key: "swim"},
        {rus: "Она рисует картины", eng: "She ... pictures", key: "draws"},
        {rus: "Я звонию бабушке каждые выходные", eng: "I ... my grandmother every weekend", key: "call"},
        {rus: "Они изучают историю", eng: "They ... history", key: "study"},
        {rus: "Он чинит машины", eng: "He ... cars", key: "fixes"},
        {rus: "Мы собираем ягоды в лесу", eng: "We ... berries in the forest", key: "pick"},
        {rus: "Она продает цветы", eng: "She ... flowers", key: "sells"},
        {rus: "Я мою посуду после ужина", eng: "I ... dishes after dinner", key: "wash"},
        {rus: "Они открывают магазин в 9 утра", eng: "They ... the shop at 9 AM", key: "open"},
        {rus: "Он закрывает окно на ночь", eng: "He ... the window at night", key: "closes"},
        {rus: "Мы приглашаем гостей на обед", eng: "We ... guests for dinner", key: "invite"},
        {rus: "Она объясняет правила игры", eng: "She ... the rules of the game", key: "explains"},
        {rus: "Я верю в удачу", eng: "I ... in luck", key: "believe"},
        {rus: "Он идет в школу пешком", eng: "He ... to school on foot", key: "goes"},
        {rus: "Она идет в спортзал каждый день", eng: "She ... to the gym every day", key: "goes"},
        {rus: "Мой папа идет на работу рано", eng: "My dad ... to work early", key: "goes"},
        {rus: "Автобус идет в центр города", eng: "The bus ... to the city center", key: "goes"},
        {rus: "Время идет быстро", eng: "Time ... fast", key: "goes"},
        {rus: "Она делает домашнее задание", eng: "She ... homework", key: "does"},
        {rus: "Он делает зарядку утром", eng: "He ... exercises in the morning", key: "does"},
        {rus: "Мама делает покупки в субботу", eng: "Mom ... shopping on Saturday", key: "does"},
        {rus: "Врач делает операцию", eng: "The doctor ... surgery", key: "does"},
        {rus: "Студент делает ошибки", eng: "The student ... mistakes", key: "does"}
    ];

    property var presentContinuousQuestions: [
        {rus: "Я читаю книгу сейчас", eng: "I ... a book now", key: "am reading"},
        {rus: "Она работает в данный момент", eng: "She ... at the moment", key: "is working"},
        {rus: "Мы играем в футбол прямо сейчас", eng: "We ... football right now", key: "are playing"},
        {rus: "Он изучает английский в настоящее время", eng: "He ... English at present", key: "is studying"},
        {rus: "Они живут в отеле на этой неделе", eng: "They ... at a hotel this week", key: "are staying"},
        {rus: "Моя сестра готовит ужин", eng: "My sister ... dinner", key: "is cooking"},
        {rus: "Мы встаем рано сегодня утром", eng: "We ... up early this morning", key: "are getting"},
        {rus: "Дети идут в школу сейчас", eng: "Children ... to school now", key: "are going"},
        {rus: "Она ест мороженое", eng: "She ... ice cream", key: "is eating"},
        {rus: "Мой отец ведет машину", eng: "My father ... a car", key: "is driving"},
        {rus: "Мы смотрим телевизор в данный момент", eng: "We ... TV at the moment", key: "are watching"},
        {rus: "Кот спит на диване прямо сейчас", eng: "The cat ... on the sofa right now", key: "is sleeping"},
        {rus: "Я пью кофе", eng: "I ... coffee", key: "am drinking"},
        {rus: "Она поет в душе", eng: "She ... in the shower", key: "is singing"},
        {rus: "Мы покупаем продукты", eng: "We ... groceries", key: "are buying"},
        {rus: "Он бежит в парке сейчас", eng: "He ... in the park now", key: "is running"},
        {rus: "Они говорят по-французски в данный момент", eng: "They ... French at the moment", key: "are speaking"},
        {rus: "Я делаю домашнее задание сейчас", eng: "I ... homework now", key: "am doing"},
        {rus: "Она надевает красивое платье", eng: "She ... a beautiful dress", key: "is wearing"},
        {rus: "Мы путешествуем по Европе этим летом", eng: "We ... around Europe this summer", key: "are traveling"},
        {rus: "Собака лает на почтальона", eng: "The dog ... at the postman", key: "is barking"},
        {rus: "Я помогаю маме прямо сейчас", eng: "I ... my mother right now", key: "am helping"},
        {rus: "Он играет на гитаре", eng: "He ... the guitar", key: "is playing"},
        {rus: "Мы обедаем в данный момент", eng: "We ... lunch at the moment", key: "are having"},
        {rus: "Она танцует сейчас", eng: "She ... now", key: "is dancing"},
        {rus: "Я пишу письмо другу", eng: "I ... a letter to a friend", key: "am writing"},
        {rus: "Они работают в саду сегодня", eng: "They ... in the garden today", key: "are working"},
        {rus: "Мой брат играет в теннис прямо сейчас", eng: "My brother ... tennis right now", key: "is playing"},
        {rus: "Мы идем в театр", eng: "We ... to the theatre", key: "are going"},
        {rus: "Она читает газету", eng: "She ... the newspaper", key: "is reading"},
        {rus: "Я слушаю музыку сейчас", eng: "I ... to music now", key: "am listening"},
        {rus: "Он учит новые слова в данный момент", eng: "He ... new words at the moment", key: "is learning"},
        {rus: "Мы встречаемся с друзьями сегодня", eng: "We ... friends today", key: "are meeting"},
        {rus: "Она покупает одежду", eng: "She ... clothes", key: "is buying"},
        {rus: "Я ухаживаю за растениями", eng: "I ... for my plants", key: "am caring"},
        {rus: "Они едят фрукты прямо сейчас", eng: "They ... fruit right now", key: "are eating"},
        {rus: "Он строит дом этим летом", eng: "He ... a house this summer", key: "is building"},
        {rus: "Мы плаваем в бассейне", eng: "We ... in the pool", key: "are swimming"},
        {rus: "Она рисует картину", eng: "She ... a picture", key: "is drawing"},
        {rus: "Я звоню бабушке", eng: "I ... my grandmother", key: "am calling"},
        {rus: "Они изучают историю этот семестр", eng: "They ... history this semester", key: "are studying"},
        {rus: "Он чинит машину", eng: "He ... the car", key: "is fixing"},
        {rus: "Мы собираем ягоды", eng: "We ... berries", key: "are picking"},
        {rus: "Она продает цветы сегодня", eng: "She ... flowers today", key: "is selling"},
        {rus: "Я мою посуду сейчас", eng: "I ... dishes now", key: "am washing"},
        {rus: "Они открывают новый магазин", eng: "They ... a new shop", key: "are opening"},
        {rus: "Он закрывает окно", eng: "He ... the window", key: "is closing"},
        {rus: "Мы приглашаем гостей на ужин", eng: "We ... guests for dinner", key: "are inviting"},
        {rus: "Она объясняет правила", eng: "She ... the rules", key: "is explaining"},
        {rus: "Я планирую отпуск", eng: "I ... a vacation", key: "am planning"}
    ];

    property var pronounsQuestions: [
        {rus: "У нас есть дом", eng: "... have a home", key: "We"},
        {rus: "Я читаю книгу", eng: "... read a book", key: "I"},
        {rus: "Она красивая девочка", eng: "... is a beautiful girl", key: "She"},
        {rus: "Он мой брат", eng: "... is my brother", key: "He"},
        {rus: "Они играют в парке", eng: "... play in the park", key: "They"},
        {rus: "Ты мой друг", eng: "... are my friend", key: "You"},
        {rus: "Это моя машина", eng: "... is my car", key: "It"},
        {rus: "Я учу английский", eng: "... learn English", key: "I"},
        {rus: "Мы идем в школу", eng: "... go to school", key: "We"},
        {rus: "Она любит кошек", eng: "... loves cats", key: "She"},
        {rus: "Он работает врачом", eng: "... works as a doctor", key: "He"},
        {rus: "Вы живете в городе", eng: "... live in the city", key: "You"},
        {rus: "Они смотрят фильм", eng: "... watch a movie", key: "They"},
        {rus: "Это красивый цветок", eng: "... is a beautiful flower", key: "It"},
        {rus: "Я готовлю обед", eng: "... cook lunch", key: "I"},
        {rus: "Мы покупаем хлеб", eng: "... buy bread", key: "We"},
        {rus: "Она танцует очень хорошо", eng: "... dances very well", key: "She"},
        {rus: "Он играет в футбол", eng: "... plays football", key: "He"},
        {rus: "Ты знаешь ответ", eng: "... know the answer", key: "You"},
        {rus: "Они поют песню", eng: "... sing a song", key: "They"},
        {rus: "Это большое дерево", eng: "... is a big tree", key: "It"},
        {rus: "Я встаю рано", eng: "... get up early", key: "I"},
        {rus: "Мы делаем покупки", eng: "... go shopping", key: "We"},
        {rus: "Она изучает математику", eng: "... studies mathematics", key: "She"},
        {rus: "Он водит автобус", eng: "... drives a bus", key: "He"},
        {rus: "Вы говорите правду", eng: "... tell the truth", key: "You"},
        {rus: "Они живут здесь", eng: "... live here", key: "They"},
        {rus: "Это новый телефон", eng: "... is a new phone", key: "It"},
        {rus: "Я пишу письмо", eng: "... write a letter", key: "I"},
        {rus: "Мы путешествуем летом", eng: "... travel in summer", key: "We"},
        {rus: "Она читает газету", eng: "... reads the newspaper", key: "She"},
        {rus: "Он помогает маме", eng: "... helps his mother", key: "He"},
        {rus: "Ты понимаешь урок", eng: "... understand the lesson", key: "You"},
        {rus: "Они работают вместе", eng: "... work together", key: "They"},
        {rus: "Это холодный день", eng: "... is a cold day", key: "It"},
        {rus: "Я слушаю музыку", eng: "... listen to music", key: "I"},
        {rus: "Мы играем в игры", eng: "... play games", key: "We"},
        {rus: "Она покупает платье", eng: "... buys a dress", key: "She"},
        {rus: "Он чинит велосипед", eng: "... fixes the bicycle", key: "He"},
        {rus: "Вы учитесь в университете", eng: "... study at university", key: "You"},
        {rus: "Они завтракают дома", eng: "... have breakfast at home", key: "They"},
        {rus: "Это интересная книга", eng: "... is an interesting book", key: "It"},
        {rus: "Я звоню другу", eng: "... call a friend", key: "I"},
        {rus: "Мы встречаемся в кафе", eng: "... meet at the cafe", key: "We"},
        {rus: "Она рисует картину", eng: "... draws a picture", key: "She"},
        {rus: "Он строит дом", eng: "... builds a house", key: "He"},
        {rus: "Ты делаешь домашнее задание", eng: "... do homework", key: "You"},
        {rus: "Они гуляют в парке", eng: "... walk in the park", key: "They"},
        {rus: "Это дорогая машина", eng: "... is an expensive car", key: "It"},
        {rus: "Я забочусь о собаке", eng: "... take care of the dog", key: "I"}
    ];

    property var thereIsThisIsQuestions: [
        {rus: "В комнате есть стол", eng: "... a table in the room", key: "There is"},
        {rus: "Это мой дом", eng: "... my house", key: "This is"},
        {rus: "В парке есть дети", eng: "... children in the park", key: "There are"},
        {rus: "Эти мои книги", eng: "... my books", key: "These are"},
        {rus: "В холодильнике есть молоко", eng: "... milk in the fridge", key: "There is"},
        {rus: "Это красивый цветок", eng: "... a beautiful flower", key: "This is"},
        {rus: "На столе есть яблоки", eng: "... apples on the table", key: "There are"},
        {rus: "Эти мои друзья", eng: "... my friends", key: "These are"},
        {rus: "В сумке есть телефон", eng: "... a phone in the bag", key: "There is"},
        {rus: "Это моя сестра", eng: "... my sister", key: "This is"},
        {rus: "В классе есть студенты", eng: "... students in the class", key: "There are"},
        {rus: "Эти новые туфли", eng: "... new shoes", key: "These are"},
        {rus: "В саду есть кот", eng: "... a cat in the garden", key: "There is"},
        {rus: "Это интересная книга", eng: "... an interesting book", key: "This is"},
        {rus: "На дереве есть птицы", eng: "... birds on the tree", key: "There are"},
        {rus: "Эти мои родители", eng: "... my parents", key: "These are"},
        {rus: "В кармане есть деньги", eng: "... money in the pocket", key: "There is"},
        {rus: "Это большая собака", eng: "... a big dog", key: "This is"},
        {rus: "В магазине есть покупатели", eng: "... customers in the shop", key: "There are"},
        {rus: "Эти красивые картины", eng: "... beautiful paintings", key: "These are"},
        {rus: "В коробке есть подарок", eng: "... a gift in the box", key: "There is"},
        {rus: "Это мой учитель", eng: "... my teacher", key: "This is"},
        {rus: "На улице есть машины", eng: "... cars on the street", key: "There are"},
        {rus: "Эти дорогие часы", eng: "... expensive watches", key: "These are"},
        {rus: "В шкафу есть одежда", eng: "... clothes in the wardrobe", key: "There is"},
        {rus: "Это холодный день", eng: "... a cold day", key: "This is"},
        {rus: "В школе есть учителя", eng: "... teachers in the school", key: "There are"},
        {rus: "Эти вкусные торты", eng: "... delicious cakes", key: "These are"},
        {rus: "В бутылке есть вода", eng: "... water in the bottle", key: "There is"},
        {rus: "Это старый дом", eng: "... an old house", key: "This is"},
        {rus: "В корзине есть фрукты", eng: "... fruits in the basket", key: "There are"},
        {rus: "Эти синие ручки", eng: "... blue pens", key: "These are"},
        {rus: "В печи есть хлеб", eng: "... bread in the oven", key: "There is"},
        {rus: "Это моя работа", eng: "... my job", key: "This is"},
        {rus: "В библиотеке есть люди", eng: "... people in the library", key: "There are"},
        {rus: "Эти зеленые яблоки", eng: "... green apples", key: "These are"},
        {rus: "В чашке есть чай", eng: "... tea in the cup", key: "There is"},
        {rus: "Это хорошая идея", eng: "... a good idea", key: "This is"},
        {rus: "В лесу есть животные", eng: "... animals in the forest", key: "There are"},
        {rus: "Эти белые облака", eng: "... white clouds", key: "These are"},
        {rus: "В тарелке есть суп", eng: "... soup in the plate", key: "There is"},
        {rus: "Это новая машина", eng: "... a new car", key: "This is"},
        {rus: "На небе есть звезды", eng: "... stars in the sky", key: "There are"},
        {rus: "Эти маленькие дети", eng: "... small children", key: "These are"},
        {rus: "В ящике есть инструмент", eng: "... a tool in the box", key: "There is"},
        {rus: "Это моя мечта", eng: "... my dream", key: "This is"},
        {rus: "В озере есть рыбы", eng: "... fish in the lake", key: "There are"},
        {rus: "Эти желтые цветы", eng: "... yellow flowers", key: "These are"},
        {rus: "В банке есть варенье", eng: "... jam in the jar", key: "There is"},
        {rus: "Это правильный ответ", eng: "... the right answer", key: "This is"}
    ];

    property var questionsOrder: []
    property var picturesQuestions: []


    function nextQuestion(){
        var questionData = questionsOrder.pop()
        questionsLeft=questionsOrder.length
        var title
        var question
        var page="qrc:/KeyItem.qml"
        switch (questionData.source){
        case 0:
            title="Предлоги и новые слова"
            question=picturesQuestions[questionData.index]
            page="qrc:/ImageBox.qml"
            break
        case 1:
            title="Числа"
            question=numbersQuestions[questionData.index]
            page="qrc:/PairItem.qml"
            break
        case 2:
            title="Present Simple"
            question=presentSimpleQuestions[questionData.index]
            break
        case 3:
            title="Present Continuous"
            question=presentContinuousQuestions[questionData.index]
            break
        case 4:
            title="Местоимения"
            question=pronounsQuestions[questionData.index]
            break
        case 5:
            title="There is/this is"
            question=thereIsThisIsQuestions[questionData.index]
            break
        }
        headerTitleText=title
        setLoader(page,{question:question})
        // questionsOrder.join(Array.from({length:numbersQuestions.length},(v,i)=>{v={source:1,index:i}}))
        // questionsOrder.join(Array.from({length:presentSimpleQuestions.length},(v,i)=>{v={source:2,index:i}}))
        // questionsOrder.join(Array.from({length:presentContinuousQuestions.length},(v,i)=>{v={source:3,index:i}}))
        // questionsOrder.join(Array.from({length:pronounsQuestions.length},(v,i)=>{v={source:4,index:i}}))
        // questionsOrder.join(Array.from({length:thereIsThisIsQuestions.length},(v,i)=>{v={source:5,index:i}}))
    }    
}
