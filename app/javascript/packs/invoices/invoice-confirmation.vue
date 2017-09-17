<template>
    <div class="notification is-success">
        Your payment has been processed!  Your Stripe charge ID is {{ chargeid }}.  A receipt will be emailed to you.
        Thank you for your business!
    </div>
</template>

<script>
    export default {
        data() {
            return {
                invoice: this.invoiceinput,
                chargeid: this.chargeinput
            }
        },
        props: ['invoiceinput', 'chargeinput'],
        created() {
            console.log('invoice confirmation created')
            /*this.$http.get('/charges/' + this.invoice.charge_id, {}).then(
                response => {
                    console.log(response)
                    this.charge = JSON.parse(response.bodyText).charge
                }, response => {
                    console.log(response)
                })*/
        }
    }
</script>