<template>
    <form @click.prevent="sendCard" id="payment-form">
        <div class="group">
            <label for="card-element">
                <span>Card</span>
                <div id="card-element" class="field"></div>
            </label>
        </div>
        <button type="submit">Pay $25</button>
        <div class="outcome">
            <div class="error" role="alert"></div>
        </div>
    </form>
</template>

<script>
    export default {
        data() {
            return {
                invoice: {
                    id: this.invoiceinput
                },
                stripe: Stripe('pk_test_iIiXWlThSgBTPJnqxpl7WH9g'),
                elements: null,
                card: null,
                style: {
                    base: {
                        iconColor: '#666EE8',
                        color: '#31325F',
                        lineHeight: '40px',
                        fontWeight: 300,
                        fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
                        fontSize: '15px',

                        '::placeholder': {
                            color: '#CFD7E0',
                        },
                    },
                }
            }
        },
        props: ['invoiceinput'],
        methods: {
            sendCard() {
                this.stripe.createToken(this.card).then(result => {
                    console.log(result)
                    if(result.error) {
                        console.log('errors')
                    } else {
                        //this.sendPayment(result.token)
                    }
                    }
                )
            },
            sendPayment(token) {
                this.$http.post('/invoices', {
                    invoice: { token: token },
                    invoice_id: this.invoice.id
                }).then(response => {
                    console.log(response)
                }, response => {
                    console.log(response)
                })
            }
        },
        created() {

            console.log('invoice pay created')
        },
        mounted() {
            this.elements = this.stripe.elements()
            this.card = this.elements.create('card', {style: this.style})
            this.card.mount('#card-element')
        }
    }
</script>

<style scoped>
    body {
        background: #E6EBF1;
    }

    form {
        width: 480px;
    }

    .InputElement {
        background: transparent;
        font-weight: 300;
        border: 0;
        color: #31325F;
        outline: none;
        padding-right: 10px;
        padding-left: 10px;
        cursor: text;
        width: 70%;
        height: 40px;
        float: right;
    }
</style>