<template>
    <form @submit.prevent="sendPayment" id="payment-form">
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
        methods: {
            sendPayment() {
                this.stripe.createToken(this.card).then(result => {
                    console.log(result)
                    }
                )
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