<%@ page pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<!-- Modal layout  -->
    <div class="modal-login">
        <div class="modal-login__overlay">

        </div>
        <div class="modal-login__body">
            <div class="modal-login__inner">
                <!-- Login form  -->
                <div class="auth-form">
                    <div class="auth-form__header">
                        <h3 class="auth-form__heading">Đăng nhập</h3>
                    </div>
                    <form action="${pageContext.request.contextPath }/user/login.htm" method="post">
	                    <div class="auth-form__form">
	                        <div class="auth-form__group">
	                            <input required="required" type="text" name="accountId"  class="auth-form__input" placeholder="Email/Số điện thoại/Tên đăng nhập">
	                        </div>
	                        <div data-password="${account.password }" class="auth-form__group">
	                            <input required="required" type="password" name="password" class="auth-form__input" placeholder="Mật khẩu">
	                        </div>
	                        <span class="foggot">${message }</span>
	                    </div>
	                    <div class="auth-form__controls">
	                        <button class="btn btn-login">ĐĂNG NHẬP</button>
	                    </div>
                    </form>
                    <div class="auth-form__btn-other">
                        <a href="#" class="other-forgot-password">Quên mật khẩu</a>
                        <a href="#" class="other-login-sms">Đăng nhập với SMS</a>
                    </div>
                    <div class="auth-form__social">
                        <div class="boundary">
                            <div class="boundary__border-left"></div>
                            <span class="boundary-text">HOẶC</span>
                            <div class="boundary__border-right"></div>
                        </div>
                        <div class="auth-form__btn-socials">
                            <a href="#" class="btn btn--with-icon">
                                <ion-icon name="logo-facebook"></ion-icon><span>Facebook</span>
                            </a>
                            <a href="#" class="btn btn--with-icon">
                                <ion-icon name="logo-google"></ion-icon><span>Google</span>
                            </a>
                        </div>
                        <div class="auth-form__aside">
                            <span class="aside-text">Bạn chưa có tài khoản?</span>
                            <a href="#" class="aside-link-register">Đăng ký</a>
                        </div>
                    </div>
                </div>
                <!-- End login form  -->

            </div>
        </div>
    </div>
    <div class="modal-register">
        <div class="modal-register__overlay">

        </div>
        <div class="modal-register__body">
            <div class="modal-register__inner">
                <!-- Register form  -->
                <div class="auth-form">
                    <div class="auth-form__header">
                        <h3 class="auth-form__heading">Đăng ký</h3>
                    </div>
                    <div class="auth-form__form">
	                    <form action="${pageContext.request.contextPath }/user/register.htm" modelAttribute="userInfo" method="POST">
	                        <div class="auth-form__group">
	                            <input required="required" name="accountId" type="text" class="auth-form__input" placeholder="Tên đăng nhập"/>
	                        </div>
	                        <div class="auth-form__group">
	                            <input required="required" name="password" type="password" class="auth-form__input" placeholder="Mật khẩu"/>
	                        </div>
	                        <div class="auth-form__group">
	                            <input required="required" name="rePassword" type="password" class="auth-form__input" placeholder="Nhập lại mật khẩu"/>
	                        </div>
	                        <div class="auth-form__group">
	                            <input required="required" name="phone" type="number" class="auth-form__input" placeholder="Số điện thoại"/>
	                        </div>
	                        <div class="auth-form__group">
	                            <input required="required" name="email" type="email" class="auth-form__input" placeholder="Email"/>
	                        </div>
	                    </form>
                    </div>
                    <div class="auth-form__controls">
                        <button class="btn btn-register">ĐĂNG KÝ</button>
                    </div>
                    <div class="auth-form__social">
                        <div class="boundary">
                            <div class="boundary__border-left"></div>
                            <span class="boundary-text">HOẶC</span>
                            <div class="boundary__border-right"></div>
                        </div>
                        <div class="auth-form__btn-socials">
                            <a href="#" class="btn btn--with-icon">
                                <ion-icon name="logo-facebook"></ion-icon><span>Facebook</span>
                            </a>
                            <a href="#" class="btn btn--with-icon">
                                <ion-icon name="logo-google"></ion-icon><span>Google</span>
                            </a>
                        </div>
                        <div class="auth-form__aside">
                            <span class="aside-text">Bằng việc đăng ký, bạn đã chấp nhận</span>
                            <a href="#" class="aside-link-register">Điều khoản sử dụng.</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- End register  -->