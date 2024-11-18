    /* 
     * To change this license header, choose License Headers in Project Properties.
     * To change this template file, choose Tools | Templates
     * and open the template in the editor.
     */

    function showGenerateInfor() {
      document.querySelector(".user-header-infor").textContent = "THÔNG TIN CHUNG";
      document.querySelector(".main-infor").classList.remove("hidden");
      document.getElementById("detail_infor").classList.add("hidden");
      document.getElementById("transaction_infor").classList.add("hidden");

      document.getElementById("general_info_link").classList.add("visited");
      document.getElementById("detail_info_link").classList.remove("visited");
      document.getElementById("transaction-infor_link").classList.remove("visited");
    }

    function showDetailInfor() {
      document.querySelector(".user-header-infor").textContent =
        "CHI TIẾT THÔNG TIN";
      document.getElementById("main_infor").classList.add("hidden");
      document.getElementById("detail_infor").classList.remove("hidden");
      document.getElementById("transaction_infor").classList.add("hidden");

      document.getElementById("general_info_link").classList.remove("visited");
      document.getElementById("detail_info_link").classList.add("visited");
      document.getElementById("transaction-infor_link").classList.remove("visited");
    }

    function showTransactionInfor() {
      document.querySelector(".user-header-infor").textContent =
        "LỊCH SỬ GIAO DỊCH";
      document.getElementById("main_infor").classList.add("hidden");
      document.getElementById("detail_infor").classList.add("hidden");
      document.getElementById("transaction_infor").classList.remove("hidden");

      document.getElementById("general_info_link").classList.remove("visited");
      document.getElementById("detail_info_link").classList.remove("visited");
      document.getElementById("transaction-infor_link").classList.add("visited");
      
      
    }

