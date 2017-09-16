<template>
    <div class="notification is-success">
        Your payment has been processed!  Your Stripe charge ID is {{ charge.stripe_charge_id }}.  A receipt will be emailed to you.
        Thank you for your business!
    </div>
</template>

<script>
    export default {
        data() {
            return {
                invoice: this.invoiceinput,
                charge: null
            }
        },
        props: ['invoiceinput'],
        created() {
            console.log('invoice confirmation created')
            this.$http.get('/charges/' + this.invoice.charge_id, {}).then(
                response => {
                    console.log(response)
                    this.charge = JSON.parse(response.bodyText).charge
                }, response => {
                    console.log(response)
                })
        }
    }
</script>