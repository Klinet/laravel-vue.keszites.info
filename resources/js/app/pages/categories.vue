<template>
    <div>

        <spinner v-if="app.loading"></spinner>


    </div>
</template>

<script>
    import CategorySearch from "../components/category-search";
    export default {
        name: "categories",
        components: {CategorySearch},
        props: ['app'],
        data()
        {
            return {
                categories: null,
            }
        },
        filters: {
            friendlyDate(value)
            {
                return moment(value).fromNow();
            }
        },
        mounted()
        {
            this.getCategories();
        },
        methods:
            {
                getCategories()
                {
                    let $this = this;
                    this.app.loading = true;
                    this.app.request.get('categories').then(function (response) {
                        $this.app.loading = false;
                        $this.categories = response.data;
                    })
                }
            }
    }
</script>

<style scoped>
</style>
