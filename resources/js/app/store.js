const store = {
    state: {
        loading: false,
        featuredArticle: null,
    },
    mutations: {
        setLoading (state, value) {
            state.loading = value;
        },

        setFeaturedArticle(state, value)
        {
            state.featuredArticle = value;
        }
    }
};

export default store;
