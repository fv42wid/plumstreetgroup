<template>
    <form @submit.prevent="sendCard" id="payment-form">
        <label>Card</label>
        <div id="card-element">

        </div>
        <button type="submit">Pay</button>
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
                        fontSize: '16px',
                        lineHeight: '24px'
                    }
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
                        this.sendPayment(result.token)
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
            this.card = this.elements.create('card')
            this.card.mount('#card-element')
        }
    }
</script>