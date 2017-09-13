<template>
    <div class="notification is-success">
        Your payment has been processed!  Your Stripe charge ID is ch###.  A receipt will be emailed to you.
        Thank you for your business!
    </div>
</template>

<script>
    export default {
        data() {
            return {

            }
        },
        created() {
            console.log('invoice confirmation created')
        }
    }
</script>