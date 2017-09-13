<template>
    <invoice-login :passwordinput="invoice.password"></invoice-login>
    <!--<invoice-pay :invoiceinput="invoice"></invoice-pay>-->
</template>

<script>
    import InvoiceLogin from './invoice-login.vue'
    import InvoicePay from './invoice-pay.vue'

    export default {

        data() {
            return {
                invoice: this.invoiceinput
            }
        },
        props: ['invoiceinput'],
        created() {
            console.log('invoice show created')
        },
        components: {
            'invoice-login' : InvoiceLogin,
            'invoice-pay' : InvoicePay
        }
    }
</script>