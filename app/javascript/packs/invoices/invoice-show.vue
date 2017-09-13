<template>
    <transition name="slide-fade" mode="out-in">
        <component :is="view" :invoiceinput="invoice"></component>
    </transition>
    <!--<invoice-login :passwordinput="invoice.password"></invoice-login>-->
    <!--<invoice-pay :invoiceinput="invoice"></invoice-pay>-->
</template>

<script>
    import InvoiceLogin from './invoice-login.vue'
    import InvoicePay from './invoice-pay.vue'

    export default {

        data() {
            return {
                view: 'invoice-login',
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