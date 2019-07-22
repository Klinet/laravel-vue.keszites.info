<template>
    <div class="container">

    </div>

</template>

<script>
    export default {
        name: "category-search",
        props: ['app'],
        data() {
            return {
                searchQuery: '',
                baseUrl: BASE_URL,
            }
        },
        methods: {
            onSubmit()
            {
                let $this = this;
                this.app.$router.push({name:'search', query: { query: $this.searchQuery }});
            }
        }
    }
</script>

<style scoped>
    .search-input {
        width: 500px;
        height: 50px;
        border: 3px solid #676660;
        border-radius: 15px;
        padding-left: 20px;
        padding-right: 20px;
    }
    .search-container
    {
        display: flex;
        flex-direction: column;
        flex-flow: wrap;
    }
</style>
