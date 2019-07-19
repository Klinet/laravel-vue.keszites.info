<template>
    <div class="pagination-wrapper">
        <div class="my-pagination" style="background: none">
            <a @click="previous" style="display: none"
               class="prev page-numbers"
               href="javascript:;">
                prev
            </a>

            <a @click="clickPage(page)" style="display: none"
               v-for="page in getNumberOfPagesShow"
               class="page-numbers"
               v-bind:class="{ active: page === currentPage }"
               href="javascript:;">
                {{ page }}
            </a>

            <a @click="next"
               class="btn btn-primary text-uppercase grey-dark"
               href="javascript:;">
                LOAD MORE
            </a>
        </div>
    </div>
</template>

<script>
    export default {
        name: "pagination",
        props: ['app', 'onClickPage', 'totalPages', 'page'],
        data()
        {
            return {
                currentPage: parseInt(this.page),
                lastPage: 0
            }
        },

        mounted()
        {
            this.app.$pagination = this;

        },

        computed: {
            getNumberOfPagesShow()
            {
                if (this.totalPages > 10)
                {
                    return 10;
                }

                return this.totalPages;
            }
        },

        methods: {
            previous()
            {
                if (this.currentPage === 1)
                {
                    return;
                }

                this.currentPage--;

                this.clickPage(this.currentPage);
            },

            next()
            {
                if (this.currentPage === this.totalPages)
                {
                    return;
                }

                this.currentPage++;

                this.clickPage(this.currentPage);
            },

            clickPage(page)
            {
                this.currentPage = page;

                this.onClickPage(page);
            }
        }
    }
</script>

<style scoped>

</style>
