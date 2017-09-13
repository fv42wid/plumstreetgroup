<template>
    <form @click.prevent="sendCard" id="payment-form">
        <div class="group">
            <label for="card-element">
                <span>Card</span>
                <div id="card-element" class="field"></div>
            </label>
        </div>
        <button type="submit">Pay With Stripe</button>
        <div class="outcome">
            <div class="error" role="alert"></div>
        </div>
    </form>
</template>

<script>
    export default {
        data() {
            return {
                invoice: this.invoiceinput,
                stripe: Stripe('pk_test_iIiXWlThSgBTPJnqxpl7WH9g'),
                elements: null,
                card: null,
                errorElement: null,
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
            },
            onCardChange(e) {
                console.log(e)
                this.errorElement.classList.remove('visible')
                if(e.error) {
                    this.errorElement.textContent = e.error.message
                    this.errorElement.classList.add('visible')
                }
            }
        },
        watch: {
            /*card: function() {
                console.log(this.card)
            }*/
        },
        created() {

            console.log('invoice pay created')
            console.log(this.invoice.paid)
            if(this.invoice.paid) {
                this.$emit('changeState', 'invoice-confirmation')
            }
        },
        mounted() {
            this.errorElement = document.querySelector('.error')
            this.elements = this.stripe.elements()
            this.card = this.elements.create('card', {style: this.style})
            this.card.mount('#card-element')
            this.card.addEventListener('change', this.onCardChange)

        }
    }
</script>
