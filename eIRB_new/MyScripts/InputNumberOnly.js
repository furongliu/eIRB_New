//鎖輸入--只能輸入數字
//<input type="text" style="ime-mode:disabled" onkeyup="return ValidateNumber(this,value)" />
function ValidateNumber(e, pnumber) {
    if (!/^\d+$/.test(pnumber)) {
        e.value = /^\d+/.exec(e.value);
    }
    return false;
}

