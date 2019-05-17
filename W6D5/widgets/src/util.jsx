
export function formatTime(time){
    if (time < 10) {
        return `0${time}`;
    }

    return time;
}

export function formatDay(day) {
    const days = [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
    ];

    return days[day];
}

export function formatMonth(month) {
    const months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sept",
        "Oct",
        "Nov",
        "Dec"
    ];

    return months[month];
}

export function convertKtoF(temp){
    const celsius = temp - 273.0;
    return (((9 / 5) * celsius) + 32).toFixed(1);
}
