const date = new Date();
// console.log(date.getFullYear());
const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
const afterFirstDay = new Date(date.getFullYear(), date.getMonth() + 2, 1);
const afterLastDay = new Date(date.getFullYear(), date.getMonth() + 2, 0);
const reserveDate = document.querySelector('.reserve-date');
const theaterPlace = document.querySelectorAll('.theater-place');
const theaterLocation = document.querySelectorAll('.theater-location');
const reserveTimeWant = document.querySelectorAll('.reserve-time-want');
const inputTitle = document.querySelector('.title');
const inputSelectedTheater = document.querySelector('.selectedTheater');
const inputReserveDate = document.querySelector('.reserveDate');
const inputRunningTime = document.querySelector('.runningTime');
const inputReserveWhere = document.querySelector('.reserveWhere');
const moveSeatForm = document.querySelector('.moveSeatForm');
const moveSeatButton = document.querySelector('.moveSeatButton');
const movieAge = document.querySelector('.movieAge');

let movieListAge = '';
let year = 0;
let month = 0;
add();
document.addEventListener('DOMContentLoaded', () => {
    add();
    addDate();
});

// 데이터 가져오기
function add() {
    $.ajax({
        url: 'crawling.do',
        type: 'get',
        success: function(data) {
            crawlingData = setData(data);
            // console.log(crawlingData);
            // document.querySelector('.movie-list-wrapper').append(crawlingData);
            //            poster.setAttribute('src', crawlingData[randomNumber].img)crawlingData;
            setList(data);
            movieListAge = document.querySelectorAll('.movie-list-age');
            movieListAge.forEach(li => {
                if (li.innerHTML === '15') {
                    li.classList.add('fifteen');
                } else if (li.innerHTML === '18') {
                    li.classList.add('eighteen');
                    li.innerHTML = '청불';
                } else if (li.innerHTML === 'All') {
                    li.classList.add('all');
                } else if (li.innerHTML === '12') {
                    li.classList.add('twelve');
                }
            });
            if (crawlingData.length === 0) {
                location.href = 'moveReserve.do';
            }
            
            document.querySelectorAll('.movie-list-title').forEach(li => {
                li.addEventListener('click', function() {
                    const movieListTitleActvie = document.querySelectorAll(
                        '.movie-list-title-active'
                    );
                    movieListTitleActvie.forEach(li => {
                        li.classList.remove('movie-list-title-active');
                    });
                    li.parentNode.classList.add('movie-list-title-active');
                    console.log(li.innerHTML);
                    console.log(li.parentElement);
                    console.log(li.parentElement.childNodes[1].innerHTML);
                    //form에 넘기기 위한
                    movieAge.value = li.parentElement.childNodes[1].innerHTML;
                    inputTitle.value = li.innerHTML;
                });
            });
        },
        error: function() {
            document.querySelector('.movie-list-wrapper').innerHTML =
                '데이터가없습니다 새로고침해주세요';
        },
    });
}

function setData(data) {
    data = JSON.parse(data);

    return data;
}

function setList(data) {
    document.querySelector('.movie-list-wrapper').innerHTML = JSON.parse(
        data
    ).reduce((html = '', item, index = 0) => {
        html += getMovieList(item);

        return html;
    }, ' ');
}

function getMovieList(item) {
    console.log(item);
    return `<div class="movie-list">
    <div class="movie-list-age">${item.movieAge}</div>
    <button class="movie-list-title">${item.movieTitle}</button>
</div>`;
}

function addDate() {
    const weekOfDay = ['일', '월', '화', '수', '목', '금', '토'];
    year = date.getFullYear();
    month = date.getMonth() +1;
    reserveDate.append(year + '/' + month);
    for (i = date.getDate(); i <= lastDay.getDate(); i++) {
        const button = document.createElement('button');
        const spanWeekOfDay = document.createElement('span');
        const spanDay = document.createElement('span');

        //class넣기
        button.classList = 'movie-date-wrapper';
        spanWeekOfDay.classList = 'movie-week-of-day';
        spanDay.classList = 'movie-day';

        //weekOfDay[new Date(2020-03-날짜)]
        const dayOfWeek =
            weekOfDay[new Date(year + '-' + month + '-' + i).getDay()];

        //요일 넣기
        if (dayOfWeek === '토') {
            spanWeekOfDay.classList.add('saturday');
            spanDay.classList.add('saturday');
        } else if (dayOfWeek === '일') {
            spanWeekOfDay.classList.add('sunday');
            spanDay.classList.add('sunday');
        }
        spanWeekOfDay.innerHTML = dayOfWeek;
        button.append(spanWeekOfDay);
        //날짜 넣기
        spanDay.innerHTML = i;
        button.append(spanDay);
        //button.append(i);

        reserveDate.append(button);

        dayClickEvent(button);
    }
    afterMonth = date.getMonth() +2;
    reserveDate.append(year + '/' + afterMonth);
    for (i = afterFirstDay.getDate(); i <= afterLastDay.getDate(); i++) {
        const button = document.createElement('button');
        const spanWeekOfDay = document.createElement('span');
        const spanDay = document.createElement('span');

        //class넣기
        button.classList = 'movie-date-wrapper';
        spanWeekOfDay.classList = 'movie-week-of-day';
        spanDay.classList = 'movie-day';

        //weekOfDay[new Date(2020-03-날짜)]
        const dayOfWeek =
            weekOfDay[new Date(year + '-' + afterMonth + '-' + i).getDay()];

        //요일 넣기
        if (dayOfWeek === '토') {
            spanWeekOfDay.classList.add('saturday');
            spanDay.classList.add('saturday');
        } else if (dayOfWeek === '일') {
            spanWeekOfDay.classList.add('sunday');
            spanDay.classList.add('sunday');
        }
        spanWeekOfDay.innerHTML = dayOfWeek;
        button.append(spanWeekOfDay);
        //날짜 넣기
        spanDay.innerHTML = i;
        button.append(spanDay);
        //button.append(i);

        reserveDate.append(button);

        afterDayClickEvent(button);
    }
}

function dayClickEvent(button) {
    button.addEventListener('click', function() {
        const movieDateWrapperActive = document.querySelectorAll(
            '.movie-date-wrapper-active'
        );
        movieDateWrapperActive.forEach(list => {
            list.classList.remove('movie-date-wrapper-active');
        });
        button.classList.add('movie-date-wrapper-active');
        const day = button.childNodes[1].innerHTML;
        console.log(day);
        
        $.ajax({
            url : "seatReserve.do",
            type : "POST",
            data :{
            	seatreserve_date : button.childNodes[1].innerHTML
            },
            dataType: 'JSON',
            success : function (data) {
                if(data.resultMap.code == "1"){
                    alert("success!")
                    
                } else {
                    alert("error!")
                }
                
                }
            });  //ajax
        
        inputReserveDate.value =
            year +
            '.' +
            month +
            '.' +
            button.childNodes[1].innerHTML +
            '(' +
            button.childNodes[0].innerHTML +
            ')';
        console.log(inputReserveDate.value);
    });
}
//button.childNodes[1].innerHTML -> 날짜
function afterDayClickEvent(button) {
    button.addEventListener('click', function() {
        const movieDateWrapperActive = document.querySelectorAll(
            '.movie-date-wrapper-active'
        );
        movieDateWrapperActive.forEach(list => {
            list.classList.remove('movie-date-wrapper-active');
        });
        button.classList.add('movie-date-wrapper-active');
        const day = button.childNodes[1].innerHTML;
        
        console.log(day);
        
        inputReserveDate.value =
            year +
            '.' +
            afterMonth +
            '.' +
            button.childNodes[1].innerHTML +
            '(' +
            button.childNodes[0].innerHTML +
            ')';
        console.log(inputReserveDate.value);
    });
}


theaterPlace.forEach(list => {
    list.addEventListener('click', function() {
        const theaterPlaceWrapper = document.querySelectorAll(
            '.theater-place-active'
        );
        theaterPlaceWrapper.forEach(li => {
            li.classList.remove('theater-place-active');
        });
        list.classList.add('theater-place-active');
        console.log(list.innerHTML);
        inputSelectedTheater.value = list.innerHTML;
    });
});

theaterLocation.forEach(list => {
    list.addEventListener('click', function() {
        const theaterLocationWrapper = document.querySelectorAll(
            '.theater-location-active'
        );
        theaterLocationWrapper.forEach(li => {
            li.classList.remove('theater-location-active');
        });
        list.classList.add('theater-location-active');
        console.log(list.innerHTML);
        inputSelectedTheater.value = list.innerHTML;
    });
});

reserveTimeWant.forEach(list => {
    list.addEventListener('click', function() {
        const reserveTimeActive = document.querySelectorAll('.reserve-time-active');
        const id = $(this).attr('id');
        reserveTimeActive.forEach(li => {
            li.classList.remove('reserve-time-active');
        });
        list.classList.add('reserve-time-active');
        console.log(list.innerHTML);
        inputReserveWhere.value = id;
        inputRunningTime.value = list.innerHTML;
    });
});


moveSeatButton.addEventListener('click', function() {
    if (!!inputTitle.value &&
        !!inputSelectedTheater.value &&
        !!inputReserveDate.value &&
        !!inputRunningTime.value
    ) {
        moveSeatForm.submit();
    } else {
        toastr.options = {
            positionClass: 'toast-top-full-width',
            progressBar: true,
            timeOut: 1000,
        };
        toastr.error(
            '<div style="color:white">모든 항목을 체크해 주세요</div>',
            '<div style="color:white">경고</div>', {
                timeOut: 3000,
            }
        );
    }
});