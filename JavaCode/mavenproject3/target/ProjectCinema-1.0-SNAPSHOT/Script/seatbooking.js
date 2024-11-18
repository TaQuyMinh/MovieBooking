function submitBookingForm() {
    // Lấy tất cả các checkbox chỗ ngồi được chọn
    var selectedSeats = document.querySelectorAll('.seatCheckbox:checked');

    // Nếu không có chỗ ngồi nào được chọn, hiển thị thông báo và ngăn chặn submit form
    if (selectedSeats.length === 0) {
        alert("Vui lòng chọn ít nhất một chỗ ngồi.");
        return false;
    }

    // Nếu có chỗ ngồi được chọn, cập nhật input hidden và submit form
    updateSelectedSeatsInput();
    document.getElementById("bookingForm").submit();
}


var checkboxes = document.querySelectorAll('.seats input[type="checkbox"]');
var selectedSeatsInput = document.getElementById('selectedSeatsInput');
var totalAmountInput = document.getElementById('totalAmountInput');
//
//checkboxes.forEach(function (checkbox) {
//    checkbox.addEventListener('change', function () {
//        updateSelectedSeatsInput();
//        updateTotalAmountInput();
//    });
//});

function updateSelectedSeatsInput() {
   // Lấy tất cả các checkbox chỗ ngồi được chọn
    var selectedSeats = document.querySelectorAll('.seatCheckbox:checked');

    // Tạo mảng để lưu giá trị của các chỗ ngồi được chọn
    var selectedSeatsValue = Array.from(selectedSeats).map(seat => seat.value);

    // Gán giá trị của các chỗ ngồi được chọn vào input hidden
    document.getElementById('selectedSeatsInput').value = JSON.stringify(selectedSeatsValue);
    updateSelectedSeats();
}

function updateTotalAmountInput() {
    var selectedSeats = document.querySelectorAll('.seats input[type="checkbox"]:checked');
    var totalPrice = selectedSeats.length * 100000; // Giá mỗi ghế là 100000
    totalAmountInput.value = totalPrice;
}

const maxSeats = 8;

checkboxes.forEach(function (checkbox) {
    checkbox.addEventListener('change', function () {
        var selectedSeats = document.querySelectorAll('.seats input[type="checkbox"]:checked');
        if (selectedSeats.length > maxSeats && this.checked) {
            this.checked = false;
            showModal();
        } else {
            var label = this.parentElement;
            if (this.checked) {
                label.classList.add('checked');
            } else {
                label.classList.remove('checked');
            }
            updateSelectedSeats();
            updateTotalAmountInput();
        }
    });
});

function updateSelectedSeats() {
    var selectedSeats = document.querySelectorAll('.seats input[type="checkbox"]:checked');
    var selectedSeatsText = [];
    var totalPrice = 0;
    selectedSeats.forEach(function (seat) {
        selectedSeatsText.push(seat.value);
        totalPrice += 100000;
    });
    document.getElementById('selectedSeats').textContent = selectedSeatsText.join(', ');
    document.getElementById('totalAmountDisplay').textContent = totalPrice.toLocaleString('vi-VN') + 'đ';
}

function showModal() {
    var modal = document.getElementById('myModal');
    modal.style.display = 'block';
}

var modalClose = document.querySelector('.modal .close');
modalClose.addEventListener('click', function () {
    var modal = document.getElementById('myModal');
    modal.style.display = 'none';
});

window.addEventListener('click', function (event) {
    var modal = document.getElementById('myModal');
    if (event.target === modal) {
        modal.style.display = 'none';
    }
});

function displayNotification(message) {
    var notificationDiv = document.getElementById('notification');
    notificationDiv.innerHTML = '<div class="alert alert-danger" role="alert">' + message + '</div>';
    setTimeout(function () {
        notificationDiv.innerHTML = '';
    }, 3000); // Xóa thông báo sau 3 giây
}
