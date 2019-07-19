<template>
    <div class="d-flex justify-content-center mt-5">
        <div class="card">
            <div class="card-header">
                Login Form
            </div>
            <div class="card-block">
                <div class="col-12 mt-5 mb-5">
                <h4 class="card-title">You can log with your credentials in.</h4>
                <form v-on:submit.prevent="onSubmit">
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text"
                                v-model="email"
                                class="form-control"
                                v-bind:class="{ 'is-invalid': errorEmail }"
                                placeholder="Email">
                        <div class="invalid-feedback">
                            {{ errorEmail }}
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input v-model="password"
                                type="password"
                                class="form-control"
                                v-bind:class="{ 'is-invalid': errorPassword }"
                                placeholder="Password">
                        <div class="invalid-feedback">
                            {{ errorPassword }}
                        </div>
                    </div>
                    <button :disabled="app.loading" type="submit" class="btn btn-primary">Login</button>
                </form>
                </div>
            </div>
            <div class="card-footer text-muted">
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "login",
        props: ['app'],
        data()
        {
            return {
                email: '',
                errorEmail: '',
                password: '',
                errorPassword: '',
                errors: []
            }
        },

        mounted()
        {
            if (this.app.user)
            {
                this.app.$router.push({name:'dashboard'});
            }
        },

        methods: {
            onSubmit()
            {
                this.errors = [];
                let $this = this;

                if (!this.email && this.email.length < 6)
                {
                    this.errorEmail = 'Email min 4 chars.';
                    this.errors.push(this.errorEmail);
                }
                else
                {
                    this.errorEmail = null;
                }

                if (!this.password && this.password.length < 6)
                {
                    this.errorPassword = 'Password min 4 chars.';
                    this.errors.push(this.errorPassword);
                }
                else
                {
                    this.errorPassword = null;
                }

                if (!this.errors.length)
                {
                    $this.app.loading = true;

                    let data = {
                        email: $this.email,
                        password: $this.password,
                    };
                    this.app.request.post('auth/login', data).then(function (response) {

                        $this.app.loading = false;

                        if (response.data.id)
                        {
                            $this.app.user = response.data;
                            $this.app.$router.push({name:'dashboard'});
                        }
                        else if (response.data.error === 401)
                        {
                            $this.errorPassword = 'Some login error.';
                            $this.email = '';
                            $this.password = '';
                        }
                    });
                }
            }
        }
    }
</script>
<style scoped></style>
