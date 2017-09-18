<template>
    <div>
        <div class="notification is-danger" v-for="(error, index) in loginErrors" :key="index">
            <button class="delete" @click="dismissError(index)"></button>
            {{ error }}
        </div>
        <form @submit.prevent="checkPassword">
            <div class="field">
                <label class="label">
                    Enter the password from your email:
                </label>
                <div class="control">
                    <input class="input"
                           type="password"
                           name="userPassword"
                           placeholder="Password"
                           v-model="userPassword"
                           :disabled="loading"></input>
                </div>
            </div>
            <div class="field">
                <div class="control has-text-right">
                    <button class="button is-primary"
                         :class="{ 'is-loading' : loading }"
                         type="submit"
                         :disabled="userPassword == ''">Log In</button>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                userPassword: '',
                invoicePassword: this.invoiceinput.password,
                loading: false,
                loginErrors: []
            }
        },
        props: ['invoiceinput'],
        methods: {
            checkPassword() {
                this.loading = true
                if(this.userPassword == this.invoicePassword) {
                    //transition
                    //console.log('passwords match')
                    this.loading = false
                    this.$emit('changeState', 'invoice-pay')
                } else {
                    //push to errors
                    //console.log('passwords do not match')
                    this.loginErrors.push('Password is not correct.')
                    this.loading = false
                }
            },
            dismissError(index) {
                this.loginErrors.splice(index, 1)
            }
        },
        created() {
            //console.log('invoice login created')
        }
    }
</script>