                        <form action="" method="post">
                            <div class="form-group">
                                <label for="cat_title">Update Category</label>
                                
                                <?php //EDIT BUTTON
                                
                                if(isset($_GET['edit'])) {
                                    $edit_id = $_GET['edit'];
                                    
                                    $query = "SELECT * FROM categories where cat_id = {$edit_id};";
                                    $select_categories_id = mysqli_query($connection,$query);
                                    while($row = mysqli_fetch_assoc($select_categories_id)) {
                                        $cat_id = $row['cat_id'];
                                        $cat_title = $row['cat_title'];
                                    }
                                    echo "<input value='";
                                    if(isset($cat_title)){ echo $cat_title; }
                                    echo "' type='text' class='form-control' name='cat_title'>";
                                }
                                ?>
                                <?php //UPDATE BUTTON
                                
                                if(isset($_POST['update'])) {
                                    $update_cat_title = $_POST['cat_title'];
                                    $query = "UPDATE categories SET cat_title = '{$update_cat_title}' WHERE cat_id = {$cat_id}";
                                    $result = mysqli_query($connection,$query);
                                    if(!$result) {
                                        die(mysqli_error($connection));
                                    }
                                    header("Location: categories.php?edit={$cat_id}");
                                }
                                
                                ?>
                            </div>
                            <div class="form-group">
                                <input class="btn btn-primary" type="submit" name="update" value="Update Category">
                            </div>
                        </form>