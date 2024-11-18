/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function submitBookingForm1() {
    // Lấy giá trị của radio button được chọn
    var selectedPaymentMethod = document.querySelector('input[name="paymentMethodRadio"]:checked');
    
    // Nếu không có radio button được chọn, hiển thị thông báo
    if (!selectedPaymentMethod) {
        alert("Vui lòng chọn phương thức thanh toán.");
        return false;
    }

    // Nếu có radio button được chọn, gán giá trị của nó vào input hidden
    if (selectedPaymentMethod) {
        document.getElementById('paymentMethod').value = selectedPaymentMethod.value;
    }

    // Gửi form
    document.getElementById("bookingForm1").submit();
}