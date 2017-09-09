<template>
    <transition name="slide-fade" mode="out-in">
        <div v-if="!messageSent" key="form">
            <div class="notification is-danger" v-for="(error, index) in serverErrors" :key="index">
                <button class="delete" @click="dismissError(index)"></button>
                {{ error }}
            </div>
            <form @submit.prevent="sendMessage">
                <div class="field">
                    <label class="label">Name</label>
                    <div class="control">
                        <input class="input"
                               name="name"
                               type="text"
                               placeholder="Your Name"
                               v-model="message.name"
                               :disabled="loading"
                               v-validate="'required'"></input>
                    </div>
                    <p class="help is-danger" v-show="errors.has('name')">{{ errors.first('name') }}</p>
                </div>
                <div class="field">
                    <label class="label">Email</label>
                    <div class="control">
                        <input class="input"
                               type="email"
                               name="email"
                               placeholder="Email Address"
                               v-model="message.email"
                               :disabled="loading"
                               v-validate="'required|email'"></input>
                    </div>
                    <p class="help is-danger" v-show="errors.has('email')">{{ errors.first('email') }}</p>
                </div>
                <div class="field">
                    <label class="label">Message</label>
                    <div class="control">
                        <textarea class="textarea"
                                  placeholder="Your Message"
                                  name="body"
                                  v-model="message.body"
                                  :disabled="loading"
                                  v-validate="'required'"></textarea>
                    </div>
                    <p class="help is-danger" v-show="errors.has('body')">{{ errors.first('body') }}</p>
                </div>
                <div class="field">
                    <div class="control has-text-right">
                        <button class="button is-primary"
                                v-bind:class="{ 'is-loading': loading }"
                                type="submit"
                                :disabled="!formIsValid">Submit</button>
                    </div>
                </div>
            </form>
        </div>
        <div v-else key="result">
            <article class="message is-success">
                <div class="message-header">
                    <p><strong>We've received your message!</strong></p>
                </div>
                <div class="message-body">
                    Someone will contact you within 1 day.  Thanks for reaching out!
                </div>
            </article>
        </div>
    </transition>
</template>

<script>
    export default {
        data() {
            return {
                message: {
                    name: '',
                    email: '',
                    body: ''
                },
                loading: false,
                messageSent: false,
                serverErrors: []
            }
        },
        methods: {
            sendMessage() {
                this.loading = true
                this.$http.post('/messages', {
                    message: this.message
                }).then(response => {
                    this.loading = false
                    console.log(response)
                    this.messageSent = true
                }, response => {
                    this.loading = false
                    this.serverErrors = JSON.parse(response.bodyText).errors
                })

            },
            dismissError(index) {
                this.serverErrors.splice(index, 1)
                console.log(this.serverErrors)
            }
        },
        computed: {
            formIsValid() {
                if(this.errors.any() || this.message.name == '' || this.message.email == '' || this.message.body == '') {
                    return false
                } else {
                    return true
                }
            }
        },
        created() {
            console.log('contact-form created')
        }
    }
</script>