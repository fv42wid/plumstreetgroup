<template>
    <transition name="slide-fade" mode="out-in">
        <component :is="view" :invoiceinput="invoice"
                   :customerinput="customer"
                   :chargeinput="charge"
                   @changeState="updateComponent"
                   @setCharge="setCharge"></component>
    </transition>
    <!--<invoice-login :passwordinput="invoice.password"></invoice-login>-->
    <!--<invoice-pay :invoiceinput="invoice"></invoice-pay>-->
</template>

<script>
    import InvoiceLogin from './invoice-login.vue'
    import InvoicePay from './invoice-pay.vue'
    import InvoiceConfirmation from './invoice-confirmation.vue'

    export default {

        data() {
            return {
                view: 'invoice-login',
                invoice: this.invoiceinput,
                customer: this.customerinput,
                charge: null
            }
        },
        props: ['invoiceinput', 'customerinput'],
        methods: {
            updateComponent(newComponent) {
                this.view = newComponent
            },
            setCharge(chargeID) {
                this.charge = chargeID
            }
        },
        created() {
            //console.log('invoice show created')
        },
        components: {
            'invoice-login' : InvoiceLogin,
            'invoice-pay' : InvoicePay,
            'invoice-confirmation' : InvoiceConfirmation
        }
    }
</script>