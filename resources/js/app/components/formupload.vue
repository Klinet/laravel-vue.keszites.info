<template>
    <div class="d-flex justify-content-center container">
        <div class="card">
            <div class="card-header">
                Login Form
            </div>
            <div class="card-block">
                <div class="card-header">
                    <h3 class="card-title">Load an image Up!</h3>
                </div>
                <div class="card-body">
                    <form action="javascript:void(0)" @submit.prevent="uploadSubmit"
                            enctype="multipart/form-data" method="post">
                        <div class="alert alert-success" v-if="message">{{ message[0] }}</div>
                        <div class="form-group">
                            <label for="photo">Choose a file</label>
                            <input type="file" class="form-control" id="photo" ref="file" name="file" @change="fileUpload($event.target)" required>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-danger btn-sm"
                                    :disabled="isLoading">{{ isLoading ? 'Loading...':'Upload' }}</button>
                        </div>
                    </form>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar"
                                :style="{width: progressBar + '%'}"
                                :aria-valuenow="progressBar"
                                aria-valuemin="0"
                                aria-valuemax="100">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    import axios from 'axios'
    export default {
        name: "formupload",
        props: ['app'],
        data() {
            return {
                progressBar: 0,
                message: '',
                uploaded_photo_id: '',
                isLoading: false,
                file: '',
                files: [],
                baseUrl: BASE_URL,
                uploaded_id: ''
            }
        },
        created() {
            //this.getUploadedFile()
        },
        methods: {
            fileUpload(event) {
                this.file = event.files[0]
            },
            uploadSubmit() {
                this.isLoading = true;
                this.message = '';
                let formData = new FormData();
                formData.append('file', this.file);
                axios.post(BASE_URL+'/photos/upload', formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    },
                    onUploadProgress: function( progressEvent ) {
                        this.progressBar = parseInt(Math.round((progressEvent.loaded * 100) / progressEvent.total))
                    }.bind(this)
                })
                    .then((response) => {
                        setTimeout(() => {
                            this.message = response.data.message;
                            this.uploaded_photo_id = response.data.pid;
                            console.log(this.uploaded_photo_id);
                            this.progressBar = 0;
                            this.isLoading = false;
                            this.reset();
                        })
                    })
            },
            reset() {
                this.$refs.file.value = '';
            }
        }
    }
</script>
