<template>
    <div>
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
                loading: false
            }
        },
        props: ['invoiceinput'],
        methods: {
            checkPassword() {
                if(this.userPassword == this.invoicePassword) {
                    console.log('passwords match')
                } else {
                    console.log('passwords do not match')
                }
            }
        },
        created() {
            console.log('invoice login created')
        }
    }
</script>